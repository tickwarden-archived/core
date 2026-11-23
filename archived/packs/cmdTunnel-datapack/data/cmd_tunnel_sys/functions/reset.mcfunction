# EOL entry guard; legacy Minecraft requires each command to be gated.
execute if data storage vf_eol_f11a08b8a7:lifecycle {phase:1} run data modify block 0 -66 0 auto set value 0b
execute if data storage vf_eol_f11a08b8a7:lifecycle {phase:1} run setblock 0 -66 0 minecraft:air replace

execute if data storage vf_eol_f11a08b8a7:lifecycle {phase:1} run forceload remove 0 0

execute if data storage vf_eol_f11a08b8a7:lifecycle {phase:1} run data remove storage cmd_tunnel_sys:input temp.cmd
