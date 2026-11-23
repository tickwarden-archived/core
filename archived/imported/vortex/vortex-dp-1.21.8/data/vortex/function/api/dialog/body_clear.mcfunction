# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/dialog/body_clear
execute unless data storage vortex:dialog_work dialog run return 0
data modify storage vortex:dialog_work dialog.body set value []
return 1
