# EOL entry guard; legacy Minecraft requires each command to be gated.
# Drop every recorded entry.
# Requires the tunnelscript.trusted tag, and requires confirmation
# (ts:gate/yes / ts:gate/cancel) before it actually runs.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute unless entity @s[tag=tunnelscript.trusted] run tellraw @s [{"text":"[TunnelScript] ","color":"aqua"},{"text":"You don't have permission for this action (requires the tunnelscript.trusted tag).","color":"red"}]
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute if entity @s[tag=tunnelscript.trusted] run data modify storage tunnelscript_core:gatework req set value {}
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute if entity @s[tag=tunnelscript.trusted] run data modify storage tunnelscript_core:gatework req.action set value "log_clear"
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute if entity @s[tag=tunnelscript.trusted] run data modify storage tunnelscript_core:gatework req.label set value "clear command log"
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute if entity @s[tag=tunnelscript.trusted] run data modify storage tunnelscript_core:gatework req.commands set value {}
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute if entity @s[tag=tunnelscript.trusted] run function tunnelscript_core:internal/gate/request
