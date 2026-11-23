# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_1f44a31786:lifecycle {phase:1} run return 0
# Direct named-parameter API for /playsound.
# Parameter order: sound, source, targets, pos, volume, pitch, min_volume
data modify storage rtwrapper:runtime current.params set from storage rtwrapper:api params
function rtwrapper:core/wrappers/internal/playsound
data remove storage rtwrapper:runtime current.params
