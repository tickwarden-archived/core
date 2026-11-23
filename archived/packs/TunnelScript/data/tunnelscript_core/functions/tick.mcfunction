# EOL entry guard; legacy Minecraft requires each command to be gated.
# Tick hook. Public trigger + minecart input scanner + queue processor.
# No replay of user action lists; the queue only runs captured minecart input.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run scoreboard players enable @a tunnelScript.use
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute as @a[scores={tunnelScript.use=1..}] run function tunnelscript_core:internal/trigger_dispatch
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute unless score #input_paused tunnelscript.vars matches 1.. run function tunnelscript_core:internal/minecart_scan
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute unless score #input_paused tunnelscript.vars matches 1.. run function tunnelscript_core:internal/minecart_queue_process
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run function tunnelscript_core:internal/link/init
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run function tunnelscript_core:internal/gate/timeout_check
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:minecart",tag:{display:{Name:'{"text":"@"}'}}}}]
