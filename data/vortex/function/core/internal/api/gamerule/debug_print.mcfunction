# vortex:core/internal/api/gamerule/debug_print [MACRO]
# Internal — do not call directly.
#
# Records the gamerule/get debug line in storage vortex:dbg out (no chat output; see systems/dbg/show). Split out from api/gamerule/get so the
# $(_gamerule_norm) macro arg is bound fresh from storage AFTER the normalize
# step writes it, instead of at get.mcfunction's own entry (before the value
# existed).
#
# Expects: {_gamerule_norm:"..."}

$data modify storage vortex:dbg out append value {src:"gamerule",msg:"get $(_gamerule_norm)"}
data modify storage vortex:dbg out[-1].value set from storage vortex:output gamerule
function vortex:systems/dbg/trim_out
