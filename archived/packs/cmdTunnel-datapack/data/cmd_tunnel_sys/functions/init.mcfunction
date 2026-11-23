# EOL entry guard; legacy Minecraft requires each command to be gated.
execute if data storage vf_eol_f11a08b8a7:lifecycle {phase:1} run gamerule commandBlockOutput false
execute if data storage vf_eol_f11a08b8a7:lifecycle {phase:1} run scoreboard objectives add cmd_tunnel_cfg dummy
execute if data storage vf_eol_f11a08b8a7:lifecycle {phase:1} run execute unless score #dynamic cmd_tunnel_cfg matches 0.. run scoreboard players set #dynamic cmd_tunnel_cfg 0
execute if data storage vf_eol_f11a08b8a7:lifecycle {phase:1} run tellraw @a [{"text":"[cmdTunnel-Sys]","color":"aqua"}," ",{"text":"Loaded","color":"green"}]
