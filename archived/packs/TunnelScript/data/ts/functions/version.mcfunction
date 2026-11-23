# EOL entry guard; legacy Minecraft requires each command to be gated.
# Print the installed version.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s [{"text":"TunnelScript ","color":"aqua","bold":true},{"text":"v1.1.0","color":"white"},{"text":" (Minecraft 1.19.2)","color":"gray"}]
