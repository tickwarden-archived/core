# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/dialog/translation_register [MACRO]
$data modify storage vortex:dialog_translations entries.$(locale).$(key) set value $(text)
