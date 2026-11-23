# EOL entry guard; legacy Minecraft requires each command to be gated.
# Set how many entries the log keeps. Input: storage tunnelscript:in {value:64}
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute store result score #log_max tunnelscript.vars run data get storage tunnelscript:in value
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute if score #log_max tunnelscript.vars matches ..0 run scoreboard players set #log_max tunnelscript.vars 1
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s [{"text":"[TunnelScript] log_max = ","color":"aqua"},{"score":{"name":"#log_max","objective":"tunnelscript.vars"},"color":"white"}]
