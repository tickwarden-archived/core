# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:world/region/clone [MACRO]
$clone $(x1) $(y1) $(z1) $(x2) $(y2) $(z2) $(dx) $(dy) $(dz)
