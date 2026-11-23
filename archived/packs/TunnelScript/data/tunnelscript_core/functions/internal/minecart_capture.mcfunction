# EOL entry guard; legacy Minecraft requires each command to be gated.
# Save first, clear input, then queue execution and fire callbacks.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run scoreboard players add #input_captured tunnelscript.vars 1
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run data modify storage tunnelscript:minecart last_captured set from storage tunnelscript:minecart current
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run data modify storage tunnelscript:minecart log append from storage tunnelscript:minecart current
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run data modify storage tunnelscript:minecart queue append from storage tunnelscript:minecart current
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run data modify entity @s Command set value ""
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute unless score #input_silent tunnelscript.vars matches 1.. run tellraw @p [{"text":"[TunnelScript] Input captured and queued","color":"aqua"}]
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute as @s run function #ts:input
