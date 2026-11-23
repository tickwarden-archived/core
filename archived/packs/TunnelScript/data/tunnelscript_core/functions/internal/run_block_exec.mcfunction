# EOL entry guard; legacy Minecraft requires each command to be gated.
# Place, arm and pulse the command block, then schedule its cleanup.
# Position 0 -64 0 is forceloaded for the brief moment it is needed.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run forceload add 0 0
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run setblock 0 -64 0 minecraft:air replace
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run setblock 0 -64 0 minecraft:command_block{auto:0b,TrackOutput:0b} replace
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run data modify block 0 -64 0 Command set from storage tunnelscript:in cmd
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run data modify block 0 -64 0 auto set value 1b
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run schedule function tunnelscript_core:internal/run_block_cleanup 3t replace
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute if score #log_enabled tunnelscript.vars matches 1.. run function tunnelscript_core:internal/log_append
