# vortex:core/internal/dialog/guard [MACRO]
scoreboard players set #allowed vortex.dialog_tmp 0
$execute if predicate $(guard) run scoreboard players set #allowed vortex.dialog_tmp 1
