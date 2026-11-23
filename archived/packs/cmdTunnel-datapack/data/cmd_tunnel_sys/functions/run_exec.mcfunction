# EOL entry guard; legacy Minecraft requires each command to be gated.
# Add forceload
execute if data storage vf_eol_f11a08b8a7:lifecycle {phase:1} run forceload add 0 0

# Execute command from storage using marker + command block
execute if data storage vf_eol_f11a08b8a7:lifecycle {phase:1} run setblock 0 -66 0 minecraft:command_block{Command:"",auto:0b,TrackOutput:0b} replace
execute if data storage vf_eol_f11a08b8a7:lifecycle {phase:1} run data modify block 0 -66 0 Command set from storage cmd_tunnel_sys:input temp.cmd
execute if data storage vf_eol_f11a08b8a7:lifecycle {phase:1} run data modify block 0 -66 0 auto set value 1b

execute if data storage vf_eol_f11a08b8a7:lifecycle {phase:1} run schedule function cmd_tunnel_sys:reset 2t replace
