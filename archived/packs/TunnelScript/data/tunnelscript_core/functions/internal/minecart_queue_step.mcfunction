# EOL entry guard; legacy Minecraft requires each command to be gated.
# Pop and execute one queued command.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run scoreboard players add #input_executed tunnelscript.vars 1
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run data modify storage tunnelscript:in cmd set from storage tunnelscript:minecart queue[0]
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run data modify storage tunnelscript:minecart last_executed set from storage tunnelscript:minecart queue[0]
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run data remove storage tunnelscript:minecart queue[0]
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run function tunnelscript_core:internal/run_block
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute unless score #input_silent tunnelscript.vars matches 1.. run tellraw @a [{"text":"[TunnelScript] Executing queued input","color":"green"}]
