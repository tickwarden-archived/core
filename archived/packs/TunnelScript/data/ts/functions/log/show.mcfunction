# EOL entry guard; legacy Minecraft requires each command to be gated.
# Print the recorded commands. The log is capped at #log_max entries.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s {"text":"[TunnelScript] command log","color":"aqua","bold":true}
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute store result score #log_len tunnelscript.vars run data get storage tunnelscript:log entries
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s [{"text":"entries=","color":"gray"},{"score":{"name":"#log_len","objective":"tunnelscript.vars"},"color":"white"},{"text":"  cap=","color":"gray"},{"score":{"name":"#log_max","objective":"tunnelscript.vars"},"color":"white"},{"text":"  recording=","color":"gray"},{"score":{"name":"#log_enabled","objective":"tunnelscript.vars"},"color":"white"}]
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute if score #log_len tunnelscript.vars matches 1.. run tellraw @s [{"storage":"tunnelscript:log","nbt":"entries","color":"gray","plain":true,"interpret":false}]
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute if score #log_len tunnelscript.vars matches 0 run tellraw @s {"text":"(empty)","color":"dark_gray"}
