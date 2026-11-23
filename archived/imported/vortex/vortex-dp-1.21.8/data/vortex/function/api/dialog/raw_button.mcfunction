# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/dialog/raw_button [MACRO]
# Trusted developer only. Does NOT gain operator privileges on the client.
$data modify storage vortex:dialog_work dialog.actions append value $(button)
