# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/dialog/translation_register [MACRO]
$data modify storage vortex:dialog_translations entries.$(locale).$(key) set value $(text)
