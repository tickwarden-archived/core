# EOL entry guard; legacy Minecraft requires each command to be gated.
# Print the active configuration.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s [{"text":"[TunnelScript] cooldown=","color":"aqua"},{"score":{"name":"#cooldown_max","objective":"tunnelscript.vars"},"color":"white"},{"text":"  max_actions=","color":"aqua"},{"score":{"name":"#max_actions","objective":"tunnelscript.vars"},"color":"white"}]
