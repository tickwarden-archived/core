# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/player/inv/transfer_item [MACRO]
$execute as @a[name=$(player),limit=1] at @s run item replace entity @s weapon.mainhand from entity @e[type=minecraft:chest_minecart,distance=..2,limit=1,tag=$(tag)] container.$(slot)
