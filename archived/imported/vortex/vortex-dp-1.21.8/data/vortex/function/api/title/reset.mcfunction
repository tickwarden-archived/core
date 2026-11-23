# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/title/reset [MACRO]
# Clears the title and resets fade/stay times to vanilla defaults. Input (macro arg): player
execute if data storage vortex:engine modules{title:0b} run return 0
$title @a[name=$(player),limit=1] reset
