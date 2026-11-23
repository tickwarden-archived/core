# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_95ed379a2f:lifecycle {phase:1} run return 0
data modify storage rtwrapper:runtime current set from storage rtwrapper:api request
data remove storage rtwrapper:api request
function rtwrapper:core/wrappers/handler/proc
