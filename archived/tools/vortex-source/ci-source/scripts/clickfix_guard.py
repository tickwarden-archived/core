#!/usr/bin/env python3
# AI-assisted: written with Claude (Anthropic); see the PR description and commit trailer.
"""ClickFix guard for issues, pull requests, comments and reviews.

ClickFix = social engineering that gets a person to paste and run a command themselves
("verify you are human": Win+R, Ctrl+V, Enter), usually with the payload already on the
clipboard or hidden in a script one-liner.

Runs from .github/workflows/clickfix-guard.yml. It only READS the event payload and text;
it never checks out or executes anything from a pull request. Text reaches this script
through GITHUB_EVENT_PATH, never through shell interpolation.

Default: ON (clickfix-guard.json "enabled": true). Dry run: CLICKFIX_DRY_RUN=1.
"""
import html
import json
import os
import re
import subprocess
import sys
import unicodedata

CONFIG_PATH = os.path.join(os.path.dirname(__file__), "..", "clickfix-guard.json")
DEFAULTS = {
    "enabled": True,
    "block_by_default": True,
    "exempt_author_associations": ["OWNER", "MEMBER", "COLLABORATOR"],
    "label": "clickfix-blocked",
}

# A person is told to do something by hand: the lure.
LURE = [
    r"verify (that )?you('re| are) (a )?(human|not a robot)",
    r"i'?m not a robot",
    r"\bcaptcha\b",
    r"\bnot a robot\b",
    r"(fix|resolve|solve) (this|the|that) (issue|error|problem)[^.\n]{0,40}\b(by|with|using) (running|pasting|copying|executing|typing)",
    r"copy (and|&|then) paste (the|this|these|it)",
    r"paste (it|this|the (following|command|code|text|link|script)) (in|into|to) (the )?(run|terminal|powershell|cmd|command prompt|console)",
    r"open (the )?(run (dialog|box|window)|powershell|command prompt|terminal)",
    r"press enter",
]
# The classic ClickFix key sequence. Win+R together with Ctrl+V blocks on its own: the
# command is on the clipboard, so the text may carry no payload at all.
KEY_WIN_R = r"\b(win(dows)?(\s*key)?)\s*\+\s*r\b"
KEY_CTRL_V = r"\bctrl\s*\+\s*v\b|\bcmd\s*\+\s*v\b"

# Strong payloads: block without a lure.
STRONG = [
    r"mshta(\.exe)?\s+(https?:|\\\\|vbscript|javascript)",
    r"powershell(\.exe)?[^\n]{0,200}?-w(indowstyle)?\s+hidden",
    r"powershell(\.exe)?[^\n]{0,200}?-e(nc(odedcommand)?)?\s+[a-z0-9+/=]{20,}",
    r"(iex|invoke-expression)\b[^\n]{0,200}?(downloadstring|downloadfile|invoke-webrequest|net\.webclient|\biwr\b|\birm\b)",
    r"(downloadstring|downloadfile|net\.webclient|\biwr\b|\birm\b)[^\n]{0,200}?(iex|invoke-expression)",
    r"certutil(\.exe)?[^\n]{0,80}-urlcache",
    r"bitsadmin(\.exe)?\s+/transfer",
    r"regsvr32(\.exe)?[^\n]{0,80}/i:https?:",
    r"rundll32(\.exe)?[^\n]{0,120}(javascript:|https?:)",
    r"msiexec(\.exe)?[^\n]{0,40}/i\s*https?:",
    r"base64\s+(-d|--decode)[^\n]{0,120}\|\s*(sudo\s+)?(ba|z)?sh\b",
]
# Plain payloads: block only together with a lure.
PLAIN = [
    r"(curl|wget)\b[^\n|]{0,200}\|\s*(sudo\s+)?(ba|z)?sh\b",
    r"(ba|z)?sh\s+-c\s+[\"']?\$\(\s*(curl|wget)",
    r"eval\s+[\"']?\$\(\s*(curl|wget)",
    r"\bpowershell(\.exe)?\b",
    r"\bpwsh\b\s+-c",
    r"\bcmd(\.exe)?\s+/c\b",
    r"\b(iex|invoke-expression)\b",
]
ZERO_WIDTH = dict.fromkeys(map(ord, "\u200b\u200c\u200d\u2060\ufeff\u00ad"), None)


def normalize(text):
    text = html.unescape(text or "")
    text = unicodedata.normalize("NFKC", text).translate(ZERO_WIDTH).lower()
    return re.sub(r"[ \t\r\f\v]+", " ", text)


def squash(text):
    # cmd/PowerShell escape characters and quotes used to split a keyword (po^wer`shell)
    return re.sub(r"[`^\"']", "", text)


def analyze(raw):
    """Return (blocked, reasons). Reasons are short codes; the text itself is never echoed."""
    n = normalize(raw)
    views = (n, squash(n))
    reasons = []

    def hit(patterns):
        return any(re.search(p, v) for v in views for p in patterns)

    if re.search(KEY_WIN_R, n) and re.search(KEY_CTRL_V, n):
        reasons.append("run-dialog key sequence (Win+R, Ctrl+V)")
    if hit(STRONG):
        reasons.append("script one-liner that downloads or hides execution")
    if hit(LURE) and hit(PLAIN):
        reasons.append("lure to run a command plus a command")
    return bool(reasons), reasons


def load_config():
    cfg = dict(DEFAULTS)
    try:
        with open(CONFIG_PATH, encoding="utf-8") as f:
            cfg.update(json.load(f))
    except FileNotFoundError:
        pass  # no file: defaults, which are ON
    return cfg


def gh(*args, check=True):
    if os.environ.get("CLICKFIX_DRY_RUN") == "1":
        print("DRY RUN gh", " ".join(args[:3]))
        return ""
    r = subprocess.run(["gh", *args], capture_output=True, text=True)
    if check and r.returncode != 0:
        print(f"gh {' '.join(args[:3])} failed: {r.stderr.strip()[:200]}", file=sys.stderr)
    return r.stdout


def targets(event_name, p):
    """Yield dicts: kind, number, texts, author, assoc, node_id, id."""
    if event_name == "issues":
        o = p["issue"]
        yield dict(kind="issue", number=o["number"], texts=[o.get("title"), o.get("body")],
                   author=o["user"]["login"], assoc=o.get("author_association"))
    elif event_name == "pull_request_target":
        o = p["pull_request"]
        yield dict(kind="pr", number=o["number"], texts=[o.get("title"), o.get("body")],
                   author=o["user"]["login"], assoc=o.get("author_association"))
    elif event_name == "issue_comment":
        o = p["comment"]
        yield dict(kind="comment", number=p["issue"]["number"], texts=[o.get("body")],
                   author=o["user"]["login"], assoc=o.get("author_association"),
                   node_id=o.get("node_id"), id=o["id"])
    elif event_name == "pull_request_review":
        o = p["review"]
        yield dict(kind="review", number=p["pull_request"]["number"], texts=[o.get("body")],
                   author=o["user"]["login"], assoc=o.get("author_association"),
                   node_id=o.get("node_id"), id=o["id"])
    elif event_name == "pull_request_review_comment":
        o = p["comment"]
        yield dict(kind="review_comment", number=p["pull_request"]["number"], texts=[o.get("body")],
                   author=o["user"]["login"], assoc=o.get("author_association"),
                   node_id=o.get("node_id"), id=o["id"])


NOTICE = (
    "This was removed automatically: it looked like a ClickFix lure (text that asks someone to "
    "paste or run a command by hand, for example a fake \"verify you are human\" step). "
    "Nobody here will ask you to run commands from a comment. If this was a mistake, a "
    "maintainer can restore it."
)
PLACEHOLDER = "_Removed by the ClickFix guard._"


def minimize_or_delete(repo, t):
    q = "mutation($id:ID!){minimizeComment(input:{subjectId:$id,classifier:SPAM}){minimizedComment{isMinimized}}}"
    out = gh("api", "graphql", "-f", f"query={q}", "-f", f"id={t['node_id']}", check=False) if t.get("node_id") else ""
    if '"isMinimized":true' in out.replace(" ", ""):
        return
    if t["kind"] == "comment":
        gh("api", "-X", "DELETE", f"repos/{repo}/issues/comments/{t['id']}")
    elif t["kind"] == "review_comment":
        gh("api", "-X", "DELETE", f"repos/{repo}/pulls/comments/{t['id']}")
    elif t["kind"] == "review":
        gh("api", "-X", "PUT", f"repos/{repo}/pulls/{t['number']}/reviews/{t['id']}", "-f", f"body={PLACEHOLDER}")


def block(repo, t, label):
    n = t["number"]
    gh("api", "-X", "POST", f"repos/{repo}/labels", "-f", f"name={label}", "-f", "color=B60205",
       "-f", "description=Removed by the ClickFix guard", check=False)
    gh("api", "-X", "POST", f"repos/{repo}/issues/{n}/labels", "-f", f"labels[]={label}")
    if t["kind"] in ("issue", "pr"):
        gh("api", "-X", "PATCH", f"repos/{repo}/issues/{n}", "-f", f"body={PLACEHOLDER}", "-f", "state=closed")
        gh("api", "-X", "PUT", f"repos/{repo}/issues/{n}/lock", "-f", "lock_reason=spam")
    else:
        minimize_or_delete(repo, t)
    gh("api", "-X", "POST", f"repos/{repo}/issues/{n}/comments", "-f", f"body={NOTICE}")


def main():
    cfg = load_config()
    if not cfg["enabled"] or not cfg["block_by_default"]:
        print("clickfix guard disabled by config")
        return 0
    event_name = os.environ["GITHUB_EVENT_NAME"]
    repo = os.environ.get("GITHUB_REPOSITORY", "")
    with open(os.environ["GITHUB_EVENT_PATH"], encoding="utf-8") as f:
        payload = json.load(f)
    if payload.get("sender", {}).get("type") == "Bot":
        return 0  # never act on our own notice or on other bots
    for t in targets(event_name, payload):
        if t["assoc"] in cfg["exempt_author_associations"]:
            print(f"{t['kind']} #{t['number']}: author association {t['assoc']} is exempt")
            continue
        blocked, reasons = analyze("\n".join(x for x in t["texts"] if x))
        print(f"{t['kind']} #{t['number']} by {t['author']}: {'BLOCK' if blocked else 'ok'} {reasons}")
        if blocked:
            block(repo, t, cfg["label"])
    return 0


if __name__ == "__main__":
    sys.exit(main())
