# EOL entry guard; legacy Minecraft requires each command to be gated.
# Relabel the hologram from storage tunnelscript:in { "name": <JSON text> }.
# Provide a JSON text component, e.g. '[{"text":"Shop","color":"gold"}]'.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run data modify entity @e[type=armor_stand,tag=tunnelscript_menu,limit=1] CustomName set from storage tunnelscript:in name
