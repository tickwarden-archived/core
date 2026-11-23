# EOL entry guard; legacy Minecraft requires each command to be gated.
execute if data storage vf_eol_f11a08b8a7:lifecycle {phase:1} run function #cmd_tunnel_sys:dispatch

# Dynamic gate (default off): cmd_tunnel_sys:dynamic_on enables execution.
execute if data storage vf_eol_f11a08b8a7:lifecycle {phase:1} run execute if score #dynamic cmd_tunnel_cfg matches 1 at @s run function cmd_tunnel_sys:run_exec
