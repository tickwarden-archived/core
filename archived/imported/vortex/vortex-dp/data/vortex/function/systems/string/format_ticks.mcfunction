# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:systems/string/format_ticks [MACRO]
execute if data storage vortex:engine modules{string:0b} run return 0
$scoreboard players set $ft_t vortex.tmp $(ticks)

scoreboard players set $ft_20 vortex.tmp 20
scoreboard players operation $ft_s vortex.tmp = $ft_t vortex.tmp
scoreboard players operation $ft_s vortex.tmp /= $ft_20 vortex.tmp

execute store result storage vortex:output total_seconds int 1 run scoreboard players get $ft_s vortex.tmp

scoreboard players set $ft_60 vortex.tmp 60
scoreboard players operation $ft_m vortex.tmp = $ft_s vortex.tmp
scoreboard players operation $ft_m vortex.tmp /= $ft_60 vortex.tmp

scoreboard players operation $ft_s vortex.tmp %= $ft_60 vortex.tmp

execute store result storage vortex:output minutes int 1 run scoreboard players get $ft_m vortex.tmp
execute store result storage vortex:output seconds int 1 run scoreboard players get $ft_s vortex.tmp
