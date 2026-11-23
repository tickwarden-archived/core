# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/player/var/copy [MACRO]
$data modify storage vortex:engine players.$(to).$(key) set from storage vortex:engine players.$(from).$(key)
