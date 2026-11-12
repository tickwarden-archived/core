# vortex:systems/cmd_gate/_block_loop [INTERNAL]
# Walks vortex:cmd_gate tmp.pending once, comparing each entry with
# tmp.root. String equality is the data-modify trick used by
# core/internal/text/find_loop: copying an equal value changes nothing, so
# store success is 0 exactly when the two strings match. No macro line ever
# touches the command text.

execute unless data storage vortex:cmd_gate tmp.pending[0] run return 0
data modify storage vortex:cmd_gate tmp.cmp set from storage vortex:cmd_gate tmp.root
execute store success score #vortex.cg_diff vortex.tmp run data modify storage vortex:cmd_gate tmp.cmp set from storage vortex:cmd_gate tmp.pending[0]
execute if score #vortex.cg_diff vortex.tmp matches 0 run data modify storage vortex:cmd_gate tmp.blocked set value 1b
data remove storage vortex:cmd_gate tmp.pending[0]
execute unless data storage vortex:cmd_gate tmp{blocked:1b} run function vortex:systems/cmd_gate/_block_loop
