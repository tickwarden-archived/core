# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# Vortex player module — resolve (load step 2 of 3).
# The module ships in exactly one flavour per pack, so there is nothing to
# resolving the player module means initializing it directly.

function vortex:core/internal/player/init
