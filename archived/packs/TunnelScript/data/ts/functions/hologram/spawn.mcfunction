# EOL entry guard; legacy Minecraft requires each command to be gated.
# Spawn a floating menu label at the command position. Kills any previous one.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run kill @e[type=armor_stand,tag=tunnelscript_menu]
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run summon armor_stand ~ ~ ~ {Tags:["tunnelscript_menu"],Marker:1b,Invisible:1b,NoGravity:1b,Invulnerable:1b,CustomNameVisible:1b,CustomName:'[{"text":"TunnelScript ","color":"aqua","bold":true},{"text":"Menu","color":"white"}]'}
