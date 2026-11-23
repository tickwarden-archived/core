# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:systems/dbg/err [MACRO]
# Storage-based error line: same as systems/dbg/out but into storage vortex:dbg err.
# AI-assisted: written with Claude (Anthropic); see CREDITS.md.
#
# Usage:  function vortex:systems/dbg/err {src:"cb",msg:"cb.cmd not set"}

$data modify storage vortex:dbg err append value {src:"$(src)",msg:"$(msg)"}
function vortex:systems/dbg/trim_err
