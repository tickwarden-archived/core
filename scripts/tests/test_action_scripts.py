"""Offline tests for public download, execute and Python actions."""
import contextlib
import importlib.util
import io
import json
import os
import subprocess
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch

ROOT = Path(__file__).resolve().parents[2]
def load(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod

dl = load('vf_dl_test', ROOT / 'actions/download/download.py')
execute = load('vf_exec_test', ROOT / 'actions/execute/execute.py')
vf = load('vf_python_test', ROOT / 'actions/vf_script/vf_script.py')

class PythonAction(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.env = {'GITHUB_WORKSPACE': str(self.root), 'RUNNER_TEMP': str(self.root), 'VF_AUTO_INSTALL':'false', 'VF_ARGS_JSON':'[]'}

    def test_syntax_error_before_venv_or_install(self):
        self.env.update(VF_CODE='if True print(1)', VF_PACKAGES='example==1.0')
        with patch.object(vf.venv, 'create') as make, patch.object(vf.subprocess, 'run') as run:
            with self.assertRaises(SyntaxError):
                vf.run(self.env)
            make.assert_not_called()
            run.assert_not_called()

    def test_scan_stdlib_and_project_module_runs_in_venv(self):
        (self.root / 'projectthing.py').write_text('value=42\n')
        self.env['VF_CODE'] = 'import json, projectthing\nfrom pathlib import Path\nPath("result.json").write_text(json.dumps(projectthing.value))\n'
        names, count = vf.run(self.env)
        self.assertEqual(json.loads((self.root / 'result.json').read_text()), 42)
        self.assertEqual(names, ['json', 'pathlib', 'projectthing'])
        self.assertEqual(count, 0)

    def test_missing_import_does_not_install_by_default(self):
        self.env['VF_CODE'] = 'import vf_no_such_dependency_87391'
        with self.assertRaisesRegex(ValueError, 'Unresolved static imports'):
            vf.run(self.env)

    def test_automatic_map_is_opt_in_and_unknown_fails_before_pip(self):
        self.env.update(VF_CODE='import requests\nimport vf_unknown_package', VF_AUTO_INSTALL='true')
        with patch.object(vf.venv, 'create'), patch.object(vf, 'missing_imports', return_value=['requests','vf_unknown_package']), patch.object(vf.subprocess, 'run') as run:
            with self.assertRaisesRegex(ValueError, 'Unknown import-to-package'):
                vf.run(self.env)
            run.assert_not_called()

    def test_pinned_auto_map_and_declared_install_precede_execution(self):
        self.env.update(VF_CODE='import requests', VF_AUTO_INSTALL='true', VF_PACKAGES='PyYAML==6.0.2')
        with patch.object(vf.venv, 'create'), patch.object(vf, 'missing_imports', side_effect=[['requests'], ['requests'], []]), patch.object(vf.subprocess, 'run') as run:
            _, count = vf.run(self.env)
            self.assertEqual(count, 1)
            self.assertEqual(run.call_count, 3)
            self.assertIn('PyYAML==6.0.2', run.call_args_list[0].args[0])
            self.assertIn('requests==2.32.3', run.call_args_list[1].args[0])
            self.assertIn('--only-binary=:all:', run.call_args_list[1].args[0])
            self.assertTrue(str(run.call_args_list[2].args[0][1]).endswith('inline.py'))

    def test_requirements_file_is_passed_to_pip_before_execution(self):
        req = self.root / 'requirements.txt'; req.write_text('requests==2.32.3\n')
        self.env.update(VF_CODE='import requests', VF_REQUIREMENTS='requirements.txt')
        with patch.object(vf.venv, 'create'), patch.object(vf, 'missing_imports', side_effect=[['requests'], []]), patch.object(vf.subprocess, 'run') as run:
            vf.run(self.env)
            command = run.call_args_list[0].args[0]
            self.assertIn('-r', command)
            self.assertIn(str(req), command)
            self.assertEqual(run.call_count, 2)

    def test_rejects_paths_options_and_invalid_args(self):
        self.env.update(VF_SCRIPT_PATH='../outside.py')
        with self.assertRaises(ValueError): vf.run(self.env)
        self.env.update(VF_SCRIPT_PATH='', VF_CODE='pass', VF_PACKAGES='--index-url=https://evil.test')
        with self.assertRaises(ValueError): vf.run(self.env)
        self.env.update(VF_PACKAGES='', VF_ARGS_JSON='[1]')
        with self.assertRaises(ValueError): vf.run(self.env)

class DownloadAction(unittest.TestCase):
    def test_rejects_foreign_repo_ref_and_paths_before_network(self):
        with tempfile.TemporaryDirectory() as d:
            for repo,ref,dest in [('other/repo','main','out'),('core','--upload-pack=x','out'),('core','main','../outside'),('core','main','bad\nname')]:
                with self.subTest(repo=repo, ref=ref, dest=dest), patch.object(dl.urllib.request, 'urlopen') as url:
                    with self.assertRaises(ValueError): dl.download(repo,ref,dest,d)
                    url.assert_not_called()

    def test_existing_destination_never_overwritten(self):
        with tempfile.TemporaryDirectory() as d:
            keep = Path(d)/'out';keep.mkdir();(keep/'keep').write_text('x')
            with patch.object(dl.urllib.request, 'urlopen') as url:
                with self.assertRaisesRegex(ValueError,'already exists'): dl.download('core','main','out',d)
                url.assert_not_called()
            self.assertEqual((keep/'keep').read_text(), 'x')

    def test_private_repo_is_rejected(self):
        class Response(io.BytesIO):
            status = 404
            def geturl(self): return 'https://github.com/vortaforge/core'
            def __enter__(self): return self
            def __exit__(self,*args): self.close()
        with tempfile.TemporaryDirectory() as d, patch.object(dl.urllib.request,'urlopen',return_value=Response(b'')):
            with self.assertRaisesRegex(ValueError,'public'): dl.download('core','main','out',d)
            self.assertFalse((Path(d)/'out').exists())

class ExecuteAction(unittest.TestCase):
    def test_runs_script_with_separate_cwd_and_string_args(self):
        with tempfile.TemporaryDirectory() as d:
            workspace=Path(d);repo=workspace/'checkout';repo.mkdir();(repo/'show.py').write_text('import pathlib,sys\npathlib.Path("result.txt").write_text("|".join(sys.argv[1:]))\n')
            with patch.object(execute.downloader,'download',return_value=(repo,'a'*40)):
                _,sha=execute.execute('core','main','checkout','show.py','python3','["hello world"]','workspace',d)
            self.assertEqual(sha,'a'*40)
            self.assertEqual((workspace/'result.txt').read_text(),'hello world')
            self.assertFalse((repo/'result.txt').exists())

    def test_runs_script_with_repository_cwd(self):
        with tempfile.TemporaryDirectory() as d:
            repo=Path(d)/'checkout';repo.mkdir();(repo/'show.py').write_text('import pathlib\npathlib.Path("result.txt").write_text("repo")\n')
            with patch.object(execute.downloader,'download',return_value=(repo,'b'*40)):
                execute.execute('core','main','checkout','show.py','python3','[]','repository',d)
            self.assertEqual((repo/'result.txt').read_text(),'repo')
            self.assertFalse((Path(d)/'result.txt').exists())

    def test_rejects_traversal_and_malformed_args_before_clone(self):
        with patch.object(execute.downloader,'download') as clone:
            for script,args in [('../x','[]'),('valid.py','[1]')]:
                with self.assertRaises(ValueError): execute.execute('core','main','out',script,'python3',args,'workspace','/tmp')
            clone.assert_not_called()

if __name__ == '__main__': unittest.main()
