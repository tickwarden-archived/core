# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/api/title/_apply [MACRO, INTERNAL]
# $(fade_in) $(stay) $(fade_out) are numbers copied from storage by show_p.
# macroengine:title t and s are plain strings; interpret=false prints them as written.
$title @s times $(fade_in) $(stay) $(fade_out)
title @s subtitle {"storage":"macroengine:title","nbt":"s","interpret":false,"plain":true}
title @s title {"storage":"macroengine:title","nbt":"t","interpret":false,"plain":true}
