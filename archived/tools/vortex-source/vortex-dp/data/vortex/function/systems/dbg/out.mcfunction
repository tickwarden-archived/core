# vortex:systems/dbg/out [MACRO]
# Storage-based debug line. Replaces chat tellraw spam: nothing is printed, the line goes to
# storage vortex:dbg out (ring buffer, newest last, 50 entries). Read it with systems/dbg/show.
# AI-assisted: written with Claude (Anthropic); see CREDITS.md.
#
# Usage:  function vortex:systems/dbg/out {src:"cb",msg:"queue pushed"}
# $(src) and $(msg) are written by the datapack author, not by players: no quotes or backslashes.

$data modify storage vortex:dbg out append value {src:"$(src)",msg:"$(msg)"}
function vortex:systems/dbg/trim_out
