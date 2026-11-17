# vortex:api/dialog/body [MACRO]
$data modify storage vortex:dialog_work dialog.body append value {type:"minecraft:plain_message",contents:$(text),width:$(width)}
execute if data storage vortex:dialog_work theme.body run data modify storage vortex:dialog_work dialog.body[-1].contents merge from storage vortex:dialog_work theme.body
