# EOL entry guard; legacy Minecraft requires each command to be gated.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute as @e[type=minecraft:command_block_minecart,tag=tunnelscript_input] as @a at @s anchored eyes align y positioned ^ ^ ^0.0 run tp @e[sort=nearest,limit=1,tag=tunnelscript_input] ~ ~-0.23 ~
