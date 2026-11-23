# EOL entry guard; legacy Minecraft requires each command to be gated.
# Disable + remove the command block and release the forceload.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run data modify block 0 -64 0 auto set value 0b
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run setblock 0 -64 0 minecraft:air replace
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run forceload remove 0 0
