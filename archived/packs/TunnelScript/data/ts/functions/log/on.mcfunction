# EOL entry guard; legacy Minecraft requires each command to be gated.
# Record every command the runner executes into storage tunnelscript:log entries[].
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run scoreboard players set #log_enabled tunnelscript.vars 1
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s [{"text":"[TunnelScript] ","color":"aqua"},{"text":"command log ON","color":"green"}]
