# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/api/cb/repeat_build [INTERNAL]
# Appends vortex:input cb.cmd to cb.cmds, #cb_rep_n times (counts #cb_rep_n down to 0).
data modify storage vortex:input cb.cmds append from storage vortex:input cb.cmd
scoreboard players remove #cb_rep_n vortex.tmp 1
execute if score #cb_rep_n vortex.tmp matches 1.. run function vortex:core/internal/api/cb/repeat_build
