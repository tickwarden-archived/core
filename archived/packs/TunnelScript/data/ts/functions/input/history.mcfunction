# EOL entry guard; legacy Minecraft requires each command to be gated.
# Show a summary of captured minecart inputs. Full log: storage tunnelscript:minecart log[].
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s [{"text":"[TunnelScript] Minecart input history","color":"aqua","bold":true}]
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run execute store result score #hist_len tunnelscript.vars run data get storage tunnelscript:minecart log
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s [{"text":"Total captured entries: ","color":"gray"},{"score":{"name":"#hist_len","objective":"tunnelscript.vars"},"color":"white"}]
