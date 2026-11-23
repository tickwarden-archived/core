# EOL entry guard; legacy Minecraft requires each command to be gated.
# Remove the in-world menu hologram(s).
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run kill @e[type=armor_stand,tag=tunnelscript_menu]
