# EOL entry guard; legacy Minecraft requires each command to be gated.
# Grant the calling entity permission to use the gated dangerous actions
# (run_command, run_commands, batch/run, batch/delete, and the input/log/
# dryrun reset & clear commands). Intended to be run by an operator, e.g.:
#   /execute as <player> run function ts:trust/grant
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tag @s add tunnelscript.trusted
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s ["",{"text":"[TunnelScript] ","color":"aqua"},{"text":"Granted: you can now request gated actions.","color":"green"}]
