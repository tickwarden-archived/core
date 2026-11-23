# EOL entry guard; legacy Minecraft requires each command to be gated.
# Set the max actions processed per run (safety cap).
# Input: storage tunnelscript:in { "value": 256 }
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute store result score #max_actions tunnelscript.vars run data get storage tunnelscript:in value
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s [{"text":"[TunnelScript] max_actions = ","color":"aqua"},{"score":{"name":"#max_actions","objective":"tunnelscript.vars"},"color":"white"}]
