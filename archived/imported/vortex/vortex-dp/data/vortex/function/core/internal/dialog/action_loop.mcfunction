# vortex:core/internal/dialog/action_loop
execute unless data storage vortex:dialog_dispatch stack[-1].pending[0] run return 1
data modify storage vortex:dialog_dispatch stack[-1].current set from storage vortex:dialog_dispatch stack[-1].pending[0]
data remove storage vortex:dialog_dispatch stack[-1].pending[0]
data modify storage vortex:dialog_action action set from storage vortex:dialog_dispatch stack[-1].current
data modify storage vortex:dialog_action payload set from storage vortex:dialog_dispatch stack[-1].payload
execute if data storage vortex:dialog_action action.payload run data modify storage vortex:dialog_action payload set from storage vortex:dialog_action action.payload
data modify storage vortex:dialog_action index set from storage vortex:dialog_dispatch stack[-1].index
data modify storage vortex:dialog_action cancelled set value 0b
data modify storage vortex:dialog_action result set value 0
data modify storage vortex:dialog_dispatch stack[-1].result set value 0
function vortex:core/internal/dialog/event_context
function #vortex:hook/dialog_before_action
# Observers may cancel but cannot replace the trusted queued action.
execute store result score #cancel vortex.dialog_tmp run data get storage vortex:dialog_action cancelled
execute store result storage vortex:dialog_dispatch stack[-1].cancelled byte 1 run scoreboard players get #cancel vortex.dialog_tmp
data modify storage vortex:dialog_action action set from storage vortex:dialog_dispatch stack[-1].current
data modify storage vortex:dialog_action payload set from storage vortex:dialog_dispatch stack[-1].payload
execute if data storage vortex:dialog_action action.payload run data modify storage vortex:dialog_action payload set from storage vortex:dialog_action action.payload
execute unless score #cancel vortex.dialog_tmp matches 1 run function vortex:core/internal/dialog/action_execute
# Restore action metadata after nested callback chains.
data modify storage vortex:dialog_action action set from storage vortex:dialog_dispatch stack[-1].current
data modify storage vortex:dialog_action index set from storage vortex:dialog_dispatch stack[-1].index
data modify storage vortex:dialog_action result set from storage vortex:dialog_dispatch stack[-1].result
function vortex:core/internal/dialog/event_context
data modify storage vortex:dialog_action cancelled set from storage vortex:dialog_dispatch stack[-1].cancelled
data modify storage vortex:dialog_action payload set from storage vortex:dialog_dispatch stack[-1].payload
execute if data storage vortex:dialog_action action.payload run data modify storage vortex:dialog_action payload set from storage vortex:dialog_action action.payload
function #vortex:hook/dialog_after_action
execute store result score #action_result vortex.dialog_tmp run data get storage vortex:dialog_dispatch stack[-1].result
execute if data storage vortex:dialog_dispatch stack[-1].current{stop_on_failure:1b} if score #action_result vortex.dialog_tmp matches 0 run return 0
execute store result score #index vortex.dialog_tmp run data get storage vortex:dialog_dispatch stack[-1].index
scoreboard players add #index vortex.dialog_tmp 1
execute store result storage vortex:dialog_dispatch stack[-1].index int 1 run scoreboard players get #index vortex.dialog_tmp
execute if score #index vortex.dialog_tmp matches 64.. run return 0
return run function vortex:core/internal/dialog/action_loop
