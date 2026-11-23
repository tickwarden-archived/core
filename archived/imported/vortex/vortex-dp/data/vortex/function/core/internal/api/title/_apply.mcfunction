# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/api/title/_apply [MACRO, INTERNAL]
# $(fade_in) $(stay) $(fade_out) are numbers copied from storage by show_p.
# vortex:title t and s are plain strings; interpret=false prints them as written.
$title @s times $(fade_in) $(stay) $(fade_out)
title @s subtitle {"storage":"vortex:title","nbt":"s","interpret":false,"plain":true}
title @s title {"storage":"vortex:title","nbt":"t","interpret":false,"plain":true}
