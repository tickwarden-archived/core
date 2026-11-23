# EOL entry guard; legacy Minecraft requires each command to be gated.
# Block cmd_tunnel_sys:run at the gate (default).
execute if data storage vf_eol_f11a08b8a7:lifecycle {phase:1} run scoreboard players set #dynamic cmd_tunnel_cfg 0
execute if data storage vf_eol_f11a08b8a7:lifecycle {phase:1} run tellraw @s [{"text":"[cmdTunnel-Sys]","color":"aqua"}," ",{"text":"dynamic commands OFF","color":"yellow"}]
