# Public reusable GitHub Actions

These composite actions live in the public `vortaforge/core` repository. Any GitHub account or organization, including personal accounts, can reference them from a workflow after the containing commit is published. A consumer's organization Actions policy must allow public third-party actions. Marketplace registration is not required and has not been enabled.

For reproducible and safer consumption, pin the reference to the full 40-character commit SHA you have reviewed. `@main` in the examples follows new changes and should be used only if that is acceptable. Until this pull request is merged, `@main` does **not** contain these actions; a published PR commit SHA can be used for testing. No repository-specific secret, VortaForge membership or personal access token is required for these actions. Actions do not change access settings of the consumer repository. Use a read-only `GITHUB_TOKEN` unless your own workflow needs more.

## Setup toolchain

Select only the tools needed. The action does not check out code, install project dependencies, run a build, connect to a game server, or publish a release. Java and Node support version syntax accepted by the underlying setup actions. Gradle wrapper validation defaults to `true`. Python pip caching is opt-in and requires dependency files or `python-cache-dependency-path`.

```yaml
permissions:
  contents: read
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@3d3c42e5aac5ba805825da76410c181273ba90b1
        with:
          persist-credentials: false
      - uses: vortaforge/core/.github/actions/setup-toolchain@main
        id: toolchain
        with:
          python-version: '3.12'
          node-version: '24'
          java-version: '25'
          java-distribution: temurin
          gradle: 'true'
          validate-gradle-wrappers: 'true'
      - run: python --version && node --version && java -version
```

Optional outputs: `python-version`, `node-version` and `java-version`; skipped tools have empty outputs. `python-cache: 'true'` requires a Python version. `gradle: 'true'` requires Java. Inputs accepting booleans must be quoted strings `true` or `false`. Underlying setup actions are pinned by full SHA in the action metadata, but they still download tools or use caches as documented by their maintainers. Run on hosted Ubuntu with Bash; other operating systems and self-hosted runners have not been verified.

## Verify SHA-256 manifests

Generate a GNU-style `SHA256SUMS` (`sha256sum -- file1 file2 > SHA256SUMS`), then:

```yaml
      - uses: vortaforge/core/.github/actions/verify-sha256@main
        id: checksum
        with:
          directory: release-assets
          manifest: SHA256SUMS
          reject-extra: 'true'
          allow-empty: 'false'
          summary: 'true'
      - env:
          VERIFIED_COUNT: ${{ steps.checksum.outputs.files }}
        run: echo "Verified $VERIFIED_COUNT files"
```

Requires Python 3.9+ and Bash on the runner. Supports relative nested paths, rejects missing files, digest mismatches, unsafe paths, duplicate entries and symlinks; empty files are rejected by default. With `reject-extra: 'true'`, all regular files except the manifest must be listed. Outputs are `files` and `bytes`. No network, token, upload, deletion or publication is performed. This verifies integrity against the supplied manifest, not provenance: verify the manifest itself through a trusted channel.

## Repository workflows

`quality.yml`, `backup-org.yml` and `macroengine-modules.yml` use the same local toolchain action after checkout; `quality.yml` additionally verifies the generated release checksum manifest. The disabled publication job is unchanged and does not check out repository code under write permissions. Existing required job names, secret handling, deployment triggers and backup behavior remain unchanged.

## Download a public VortaForge repository

```yaml
      - uses: vortaforge/core/.github/actions/download@main
        id: source
        with:
          repository: docs                 # or vortaforge/docs
          ref: main                        # use a reviewed commit SHA in production
          destination: downloaded/docs     # new relative path in the workspace
      - run: echo "Downloaded $SOURCE_SHA"
        env:
          SOURCE_SHA: ${{ steps.source.outputs.sha }}
```

Only public repositories owned by `vortaforge` are accepted; the action does not use private-repository credentials or submodules. The target must not exist, and a failed checkout is left in place for inspection. Outputs are the absolute `path` and resolved `sha`. The GitHub public API rate limit applies. The caller must have Python 3.9+ and Git installed. A mutable ref may change: pin a full reviewed SHA. Existing workspace files are not overwritten.

## Execute a script from a public VortaForge repository

```yaml
      - uses: vortaforge/core/.github/actions/execute@main
        with:
          repository: core
          ref: main
          destination: downloaded/core
          script: scripts/repo/datapacks_disable.py
          interpreter: python3
          args-json: '["status"]'
          working-directory: workspace      # or repository (default)
```

The script must be inside the downloaded repository; arguments are a JSON string array, passed without a shell. Supported interpreters are `python3`, `bash`, `node`, and `direct`. The action clones to a new path and exposes `path` and `sha` outputs after success. The script executes with the caller job's permissions and access to the workspace and job environment: **this is not a sandbox**. A public repository or a pinned commit does not make its code trustworthy. Review scripts and pin refs; do not run untrusted code in privileged jobs or expose secrets to it.

## Run Python code: `vf_script`

```yaml
      - uses: vortaforge/core/.github/actions/vf_script@main
        with:
          code: |
            import requests
            print(requests.__version__)
          packages: |
            requests==2.32.3
          auto-install: 'false'
```

Supply exactly one of inline `code` or a workspace-relative `script-path`. The action parses and compiles the code before installing anything, scans static top-level import names, creates an isolated temporary venv, installs declared `packages` and/or a workspace-relative `requirements` file using pip, then checks imports and runs the code in the caller workspace. `args-json` supplies string arguments. `ignore-imports` is a comma-separated list for intentionally optional static imports. Outputs: `imports` and `automatic-packages`.

By default unknown dependencies are never guessed. If `auto-install: 'true'` is explicitly set, only three pinned direct mappings are attempted: `requests` → `requests==2.32.3`, `yaml` → `PyYAML==6.0.2`, `PIL` → `Pillow==11.1.0`. Unknown imports fail rather than guessing PyPI names. pip uses isolated mode and wheel-only installs; transitive dependencies are not necessarily pinned. A requirements file is trusted input and may itself configure pip. Verify package provenance and use fully pinned, hash-locked dependencies where needed. No package installation method guarantees code safety.

The scanner does not evaluate dynamic imports, package extras, runtime-only branches or all import-name/distribution-name mismatches. Optional or platform-specific imports may need `ignore-imports`. It checks syntax and availability, not correctness or safety. Python and installed dependencies execute with the workflow job's privileges, network and environment; the venv is **not** a security sandbox. Never run untrusted Python or requirements with privileged credentials. Hosted Ubuntu with Python 3.9+, `venv`/`pip`, Git and Bash is the tested environment.
