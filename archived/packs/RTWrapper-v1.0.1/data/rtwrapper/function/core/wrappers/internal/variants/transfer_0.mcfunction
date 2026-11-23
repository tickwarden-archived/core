# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_1f44a31786:lifecycle {phase:1} run return 0
# /transfer has no safe/generated zero-parameter form in RTWrapper.
return fail
