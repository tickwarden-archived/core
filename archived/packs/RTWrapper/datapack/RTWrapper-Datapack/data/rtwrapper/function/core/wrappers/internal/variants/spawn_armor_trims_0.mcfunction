# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_95ed379a2f:lifecycle {phase:1} run return 0
# /spawn_armor_trims has no safe/generated zero-parameter form in RTWrapper.
return fail
