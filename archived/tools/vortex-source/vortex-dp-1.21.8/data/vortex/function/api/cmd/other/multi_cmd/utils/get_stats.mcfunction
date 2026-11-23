# ─────────────────────────────────────────────────────────────────
# vortex:api/cmd/other/multi_cmd/utils/get_stats
# Mevcut istatistikleri vortex:output'a kopyala
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{cmd:0b} run return 0
execute if score #perm_cmd vortex.tick_flags matches 1 run data modify storage vortex:perm_require in set value {perm:"cmd.other.multi_cmd.utils.get_stats"}
execute if score #perm_cmd vortex.tick_flags matches 1 unless function vortex:api/perm/require run return 0
data modify storage vortex:output stats set from storage vortex:engine _mcmd_stats
