# EOL entry guard; legacy Minecraft requires each command to be gated.
# Re-run the most recently executed command.
# Requires the command log (ts:log/on), because that is what remembers it.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute unless score #log_enabled tunnelscript.vars matches 1.. run tellraw @s [{"text":"[TunnelScript] ","color":"aqua"},{"text":"repeat needs the command log: run ","color":"red"},{"text":"function ts:log/on","color":"gray"}]
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute if score #log_enabled tunnelscript.vars matches 1.. unless data storage tunnelscript:log entries[0] run tellraw @s {"text":"[TunnelScript] nothing to repeat yet","color":"yellow"}
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute if score #log_enabled tunnelscript.vars matches 1.. if data storage tunnelscript:log entries[0] run function tunnelscript_core:internal/log_rerun
