# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:systems/text/bool [MACRO]
# Prints an NBT boolean or 0/1 as "yes" / "no".
#
# INPUT: $(storage), $(path)
#
# A raw boolean renders as a coloured 1b, which reads badly in a status
# line. This maps the value instead of printing it. A missing path
# reports "no" rather than nothing, so the line still lines up.
#
# Usage:  function vortex:systems/text/bool {storage:"vortex:engine",path:"tick.paused"}
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{text:0b} run return 0
$execute store success score $text_bool_ok vortex.tmp run data get storage $(storage) $(path)
execute if score $text_bool_ok vortex.tmp matches 0 run tellraw @s [{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"no","color":"red"}]
$execute if score $text_bool_ok vortex.tmp matches 1 store result score $text_bool_val vortex.tmp run data get storage $(storage) $(path)
execute if score $text_bool_ok vortex.tmp matches 1 if score $text_bool_val vortex.tmp matches 0 run tellraw @s [{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"no","color":"red"}]
execute if score $text_bool_ok vortex.tmp matches 1 unless score $text_bool_val vortex.tmp matches 0 run tellraw @s [{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"yes","color":"green"}]
scoreboard players reset $text_bool_ok vortex.tmp
scoreboard players reset $text_bool_val vortex.tmp
