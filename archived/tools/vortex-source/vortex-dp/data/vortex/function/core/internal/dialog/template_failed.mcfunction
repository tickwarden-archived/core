# vortex:core/internal/dialog/template_failed
scoreboard players set #template_ok vortex.dialog_tmp 0
# Invalidate the draft owner so a partially rekeyed template cannot be shown.
data modify storage vortex:dialog_work owner set value -1
return 0
