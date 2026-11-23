# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/systems/geo/region_watch/unregister_check [MACRO]
# INPUT: $(id) — _rw_cur'dan beslenir
# If id does not match, add to _rw_new (keep).

$execute unless data storage vortex:engine {_rw_unbind_id:"$(id)"} run data modify storage vortex:engine _rw_new append from storage vortex:engine _rw_cur
