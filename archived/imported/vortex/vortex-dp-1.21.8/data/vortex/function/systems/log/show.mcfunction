# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:systems/log/show
execute if data storage vortex:engine modules{log:0b} run return 0
execute unless data storage vortex:engine log_display[0] run tellraw @s {"text":"[Log] No entries.","color":"gray","italic":false}
execute unless data storage vortex:engine log_display[0] run return 0

function vortex:core/runtime/input_push
data modify storage vortex:engine _felist_input set from storage vortex:engine log_display
data modify storage vortex:input func set value "vortex:core/internal/systems/log/print_entry"
function vortex:core/internal/core/lib/for_each/list with storage vortex:input {}
function vortex:core/runtime/input_pop
