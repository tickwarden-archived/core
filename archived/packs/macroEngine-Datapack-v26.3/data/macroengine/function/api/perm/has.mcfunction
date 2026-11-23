# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:api/perm/has [MACRO]
execute if data storage macroengine:engine modules{perm:0b} run return 0
data modify storage macroengine:output result set value 0b

scoreboard players set $ph_pid macroengine.tmp 0
$execute store result score $ph_pid macroengine.tmp run data get storage macroengine:engine player_pids.$(player)

execute as @a if score @s macroengine.pid = $ph_pid macroengine.tmp run execute if entity @s[tag=macroengine.admin] run data modify storage macroengine:output result set value 1b
$execute as @a if score @s macroengine.pid = $ph_pid macroengine.tmp run execute if entity @s[tag=perm.$(perm)] run data modify storage macroengine:output result set value 1b

$execute if data storage macroengine:engine permissions.$(player).$(perm) run data modify storage macroengine:output result set value 1b
