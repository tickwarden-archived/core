# vortex:systems/dbg/err [MACRO]
# Storage-based error line: same as systems/dbg/out but into storage vortex:dbg err.
# AI-assisted: written with Claude (Anthropic); see CREDITS.md.
#
# Usage:  function vortex:systems/dbg/err {src:"cb",msg:"cb.cmd not set"}

$data modify storage vortex:dbg err append value {src:"$(src)",msg:"$(msg)"}
function vortex:systems/dbg/trim_err
