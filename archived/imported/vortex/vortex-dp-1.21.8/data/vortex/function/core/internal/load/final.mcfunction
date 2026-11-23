# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/load/final
function vortex:core/version/define
function #vortex:init
# Note: #vortex:events/on_load is fired from vortex:setup, not here, so it
# also runs on /reload paths where this function is skipped (see setup).
data modify storage vortex:engine global.loaded set value 1b
tellraw @s [{"text":"[VORTEX]","color":"dark_aqua","italic":false}," ",{"text":"Loaded!","italic":false,"color":"green"}]
