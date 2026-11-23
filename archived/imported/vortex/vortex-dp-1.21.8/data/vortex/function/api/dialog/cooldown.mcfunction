# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/dialog/cooldown [MACRO]
# Sets the remaining cooldown for @s, clamped to 0..1200 ticks.
$scoreboard players set @s vortex.dialog_cool $(ticks)
execute if score @s vortex.dialog_cool matches ..-1 run scoreboard players set @s vortex.dialog_cool 0
execute if score @s vortex.dialog_cool matches 1201.. run scoreboard players set @s vortex.dialog_cool 1200
