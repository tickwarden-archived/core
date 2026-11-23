# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/callback [MACRO]
# Trusted typed action arrays; copy before invoking any reentrant renderer.
execute unless data storage vortex:dialog_dispatch stack run data modify storage vortex:dialog_dispatch stack set value []
execute store result score #depth vortex.dialog_tmp run data get storage vortex:dialog_dispatch stack
execute if score #depth vortex.dialog_tmp matches 16.. run return 0
$data modify storage vortex:dialog_dispatch stack append value {pending:$(callback),payload:$(payload),index:0}
execute store result storage vortex:dialog_dispatch stack[-1].outcome int 1 run function vortex:core/internal/dialog/action_loop
execute store result score #dispatch_return vortex.dialog_tmp run data get storage vortex:dialog_dispatch stack[-1].outcome
data remove storage vortex:dialog_dispatch stack[-1]
return run scoreboard players get #dispatch_return vortex.dialog_tmp
