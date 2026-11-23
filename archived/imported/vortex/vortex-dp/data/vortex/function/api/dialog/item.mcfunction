# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/dialog/item [MACRO]
$data modify storage vortex:dialog_work dialog.body append value {type:"minecraft:item",item:$(item),description:{contents:$(text),width:200},show_decorations:1b,show_tooltip:1b,width:16,height:16}
