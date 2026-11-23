# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ======================================================================================
# vortex:api/notice/show
# Shows the "read before you use Vortex" dialog to @s (a player), built with the
# vortex:api/dialog builder. Runs once per player automatically (see
# core/internal/notice/tick); call it yourself to show it again, e.g.
#   execute as <player> run function vortex:api/notice/show
#
# RETURN 1 when the dialog was shown, 0 otherwise (not a player, or the dialog failed).
#
# Why this exists: people who install a datapack often assume it is safe, that a human
# wrote and reviewed it, and that nothing was done the lazy way. None of that is
# guaranteed here, so the pack says so in-game, for players who never open GitHub.
#
# Facts used below come from this repository: NOTICE-modalith.md, CHANGELOG.md (0.3.0,
# "Not verified"), core/internal/player/init (UUID scores) and systems/audit/record.
# ======================================================================================

function vortex:api/dialog/begin
function vortex:api/dialog/title {text:{text:"Vortex: please read before you use this pack",color:"gold",bold:true}}

# 1. AI
function vortex:api/dialog/body {text:{text:"Written with AI. This pack was written with AI assistance (Claude by Anthropic), not by hand. AI-written code can contain mistakes. Do not assume it is safe, or that a human reviewed it, just because it is published.",color:"white"},width:300}

# 2. The shortcut
function vortex:api/dialog/body {text:{text:"A shortcut was taken. The dialog module was ported from the author's earlier project, Modalith, by renaming it into the vortex namespace. It was not rewritten from scratch. Its tests were not ported, and it was only checked statically, not played on Minecraft 1.21.8. See CHANGELOG.md and NOTICE-modalith.md in the repository.",color:"yellow"},width:300}

# 3. Review recommendation
function vortex:api/dialog/body {text:{text:"Before you use it on a real server, have a person you trust, or an AI assistant such as Claude, read the pack. Back up your world first.",color:"white"},width:300}

# 4. Personal data
function vortex:api/dialog/body {text:{text:"Personal data. A datapack cannot send data over the internet, and Vortex sends nothing. It does keep player identifiers in your world save: each player's UUID is stored in scoreboard scores, and the audit log keeps up to 100 entries with player id and UUID.",color:"gray"},width:300}

# 5. Sandbox
function vortex:api/dialog/body {text:{text:"No sandbox. Minecraft does not isolate datapacks. Every datapack, this one included, can run commands at the server's function permission level (2 by default). Vortex contains no op, stop or ban commands, but its dialog module can run commands that other datapacks give it. Only install datapacks you trust.",color:"red"},width:300}

# 6. Reporting
function vortex:api/dialog/body {text:{text:"Report problems at github.com/vortaforge/vortex/issues (a free GitHub account is needed). No GitHub account? Tell the person who runs your server and ask them to report it.",color:"aqua"},width:300}

function vortex:api/dialog/native_action/open_url {label:{text:"Report a problem"},url:"https://github.com/vortaforge/vortex/issues"}
function vortex:api/dialog/native_action/open_url {label:{text:"Source and changelog"},url:"https://github.com/vortaforge/vortex"}
function vortex:api/dialog/button {label:{text:"I understand"},callback:[{type:"close"}],payload:{}}

return run function vortex:api/dialog/show
