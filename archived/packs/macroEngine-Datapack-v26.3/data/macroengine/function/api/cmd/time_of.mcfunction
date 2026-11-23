# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ME - Universal World Clock Controller
# Usage: /function macroengine:api/cmd/time_of {clock:"macroengine:test", action:"set", value:"12000"}
execute if data storage macroengine:engine modules{cmd:0b} run return 0
execute if score #perm_cmd macroengine.tick_flags matches 1 run data modify storage macroengine:perm_require in set value {perm:"cmd.time_of"}
execute if score #perm_cmd macroengine.tick_flags matches 1 unless function macroengine:api/perm/require run return 0
$time of $(clock) $(action) $(value)
