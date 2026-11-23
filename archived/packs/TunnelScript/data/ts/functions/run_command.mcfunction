# EOL entry guard; legacy Minecraft requires each command to be gated.
# Run a single command. Input: storage tunnelscript:in { "command": "say hi" }
# ("cmd" and "command" are accepted as aliases too.)
# Requires the tunnelscript.trusted tag, and requires confirmation
# (ts:gate/yes / ts:gate/cancel) before it actually runs.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute unless entity @s[tag=tunnelscript.trusted] run tellraw @s [{"text":"[TunnelScript] ","color":"aqua"},{"text":"You don't have permission for this action (requires the tunnelscript.trusted tag).","color":"red"}]
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute if entity @s[tag=tunnelscript.trusted] run data modify storage tunnelscript_core:gatework req set value {}
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute if entity @s[tag=tunnelscript.trusted] run data modify storage tunnelscript_core:gatework req.action set value "run_command"
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute if entity @s[tag=tunnelscript.trusted] run data modify storage tunnelscript_core:gatework req.label set value "run a single command"
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute if entity @s[tag=tunnelscript.trusted] run data modify storage tunnelscript_core:gatework req.commands set value {}
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute if entity @s[tag=tunnelscript.trusted] run data modify storage tunnelscript_core:gatework req.commands.command set from storage tunnelscript:in command
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute if entity @s[tag=tunnelscript.trusted] run function tunnelscript_core:internal/gate/request
