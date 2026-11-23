# EOL entry guard; legacy Minecraft requires each command to be gated.
# Summon a command-block minecart input source at the caller's position.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run kill @e[type=command_block_minecart,tag=tunnelscript_input,limit=1,sort=nearest]
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run summon minecraft:command_block_minecart ~ ~ ~ {Tags:["tunnelscript_input"],TrackOutput:1b,NoGravity:1b,Invulnerable:1b,Silent:1b,Command:""}
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s [{"text":"[TunnelScript] Input minecart summoned. Its Command will be read automatically.","color":"aqua"}]
