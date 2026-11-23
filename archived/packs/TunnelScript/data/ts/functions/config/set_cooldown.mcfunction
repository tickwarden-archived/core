# EOL entry guard; legacy Minecraft requires each command to be gated.
# Set the run cooldown in game ticks (0 disables it).
# Input: storage tunnelscript:in { "ticks": 20 }
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute store result score #cooldown_max tunnelscript.vars run data get storage tunnelscript:in ticks
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s [{"text":"[TunnelScript] cooldown = ","color":"aqua"},{"score":{"name":"#cooldown_max","objective":"tunnelscript.vars"},"color":"white"},{"text":" ticks","color":"gray"}]
