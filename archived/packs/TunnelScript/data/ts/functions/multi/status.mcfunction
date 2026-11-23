# EOL entry guard; legacy Minecraft requires each command to be gated.
# Show the lengths of the main multi-action inputs/queues.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute store result score #commands_len tunnelscript.vars run data get storage tunnelscript:in commands
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute store result score #functions_len tunnelscript.vars run data get storage tunnelscript:in functions
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute store result score #actions_len tunnelscript.vars run data get storage tunnelscript:in actions
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s [{"text":"[TunnelScript] multi commands=","color":"aqua"},{"score":{"name":"#commands_len","objective":"tunnelscript.vars"},"color":"white"},{"text":" functions=","color":"aqua"},{"score":{"name":"#functions_len","objective":"tunnelscript.vars"},"color":"white"},{"text":" actions=","color":"aqua"},{"score":{"name":"#actions_len","objective":"tunnelscript.vars"},"color":"white"}]
