# vortex:systems/hook/internal/bind_exec [MACRO]
# INPUT: $(event) - required
# vortex:input.func OR vortex:input.cmd - one must exist
#
# Two-step: append a base compound with just event, then set func or cmd from storage.
# This avoids requiring both $(func) and $(cmd) to be present simultaneously.

$data modify storage vortex:engine hook_binds append value {event:"$(event)"}
execute if data storage vortex:input func run data modify storage vortex:engine hook_binds[-1].func set from storage vortex:input func
execute unless data storage vortex:input func run data modify storage vortex:engine hook_binds[-1].cmd set from storage vortex:input cmd
