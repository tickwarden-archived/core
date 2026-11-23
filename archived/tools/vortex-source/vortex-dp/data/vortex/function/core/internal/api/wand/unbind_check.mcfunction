# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/api/wand/unbind_check [MACRO]
# $(tag) is the tag of the current record. Add back if it does not match _wand_filter_tag.

$execute unless data storage vortex:engine {_wand_filter_tag:"$(tag)"} run data modify storage vortex:engine wand_binds append from storage vortex:engine _wand_cur
