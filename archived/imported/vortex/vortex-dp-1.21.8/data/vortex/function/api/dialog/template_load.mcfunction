# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/dialog/template_load [MACRO]
# Clones a trusted template into this player's draft, reissuing every ticket.
$execute unless data storage vortex:dialog_templates entries.$(key) run return 0
$data modify storage vortex:dialog_template source set from storage vortex:dialog_templates entries.$(key)
execute if data storage vortex:dialog_template source{notification:1b} run return 0
function vortex:api/dialog/begin
data modify storage vortex:dialog_work dialog set from storage vortex:dialog_template source.dialog
data modify storage vortex:dialog_work form set from storage vortex:dialog_template source.form
data modify storage vortex:dialog_work view set from storage vortex:dialog_template source.view
data modify storage vortex:dialog_work catalog set from storage vortex:dialog_template source.catalog
execute if data storage vortex:dialog_template source.progress_style run data modify storage vortex:dialog_work progress_style set from storage vortex:dialog_template source.progress_style
execute if data storage vortex:dialog_template source.refresh run data modify storage vortex:dialog_work refresh set from storage vortex:dialog_template source.refresh
execute if data storage vortex:dialog_template source.theme run data modify storage vortex:dialog_work theme set from storage vortex:dialog_template source.theme
execute if data storage vortex:dialog_template source.disabled_last run data modify storage vortex:dialog_work disabled_last set from storage vortex:dialog_template source.disabled_last
# Notification markers are intentionally not cloned; queued acknowledgements are not reusable templates.
data modify storage vortex:dialog_template queue set from storage vortex:dialog_template source.routes
scoreboard players set #template_ok vortex.dialog_tmp 1
function vortex:core/internal/dialog/template_routes
execute unless score #template_ok vortex.dialog_tmp matches 1 run return 0
execute if data storage vortex:dialog_work form.callback run function vortex:core/internal/dialog/template_form
execute unless score #template_ok vortex.dialog_tmp matches 1 run return 0
return 1
