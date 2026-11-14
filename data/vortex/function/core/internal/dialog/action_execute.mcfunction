# vortex:core/internal/dialog/action_execute
data modify storage vortex:dialog_dispatch stack[-1].result set value 0
execute if data storage vortex:dialog_dispatch stack[-1].current{type:"function"} store result storage vortex:dialog_dispatch stack[-1].result int 1 run function vortex:core/internal/dialog/action_function with storage vortex:dialog_action
execute if data storage vortex:dialog_dispatch stack[-1].current{type:"run_command"} store result storage vortex:dialog_dispatch stack[-1].result int 1 run function vortex:api/dialog/native_action/run_command with storage vortex:dialog_dispatch stack[-1].current
execute if data storage vortex:dialog_dispatch stack[-1].current{type:"close"} store result storage vortex:dialog_dispatch stack[-1].result int 1 run function vortex:api/dialog/native_action/close
execute if data storage vortex:dialog_dispatch stack[-1].current{type:"refresh"} store result storage vortex:dialog_dispatch stack[-1].result int 1 run function vortex:api/dialog/native_action/refresh
execute if data storage vortex:dialog_dispatch stack[-1].current{type:"delay"} store result storage vortex:dialog_dispatch stack[-1].result int 1 run function vortex:core/internal/dialog/action_delay
execute if data storage vortex:dialog_dispatch stack[-1].current{type:"conditional"} store result storage vortex:dialog_dispatch stack[-1].result int 1 run function vortex:core/internal/dialog/action_conditional
