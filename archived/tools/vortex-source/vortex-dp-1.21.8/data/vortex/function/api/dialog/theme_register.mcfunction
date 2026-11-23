# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/dialog/theme_register [MACRO]
$data modify storage vortex:dialog_theme candidate set value {key:"$(key)",theme:$(theme)}
data modify storage vortex:dialog_theme checked set value {title:{},body:{},button:{},button_width:150,body_width:300,columns:2}
data modify storage vortex:dialog_theme checked merge from storage vortex:dialog_theme candidate.theme
execute store result score #theme_bw vortex.dialog_tmp run data get storage vortex:dialog_theme checked.button_width
execute store result score #theme_body vortex.dialog_tmp run data get storage vortex:dialog_theme checked.body_width
execute store result score #theme_cols vortex.dialog_tmp run data get storage vortex:dialog_theme checked.columns
execute unless score #theme_bw vortex.dialog_tmp matches 1..1024 run return 0
execute unless score #theme_body vortex.dialog_tmp matches 1..1024 run return 0
execute unless score #theme_cols vortex.dialog_tmp matches 1..8 run return 0
$data modify storage vortex:dialog_themes entries.$(key) set from storage vortex:dialog_theme checked
return 1
