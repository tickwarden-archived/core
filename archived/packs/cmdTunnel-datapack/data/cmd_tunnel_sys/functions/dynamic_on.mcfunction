# EOL entry guard; legacy Minecraft requires each command to be gated.
# Allow cmd_tunnel_sys:run to execute the command stored in
# cmd_tunnel_sys:input temp.cmd. OFF is the default.
execute if data storage vf_eol_f11a08b8a7:lifecycle {phase:1} run scoreboard players set #dynamic cmd_tunnel_cfg 1
execute if data storage vf_eol_f11a08b8a7:lifecycle {phase:1} run tellraw @s [{"text":"[cmdTunnel-Sys]","color":"aqua"}," ",{"text":"dynamic commands ON","color":"green"}]
