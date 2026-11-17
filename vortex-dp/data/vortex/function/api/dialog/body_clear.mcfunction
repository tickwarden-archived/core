# vortex:api/dialog/body_clear
execute unless data storage vortex:dialog_work dialog run return 0
data modify storage vortex:dialog_work dialog.body set value []
return 1
