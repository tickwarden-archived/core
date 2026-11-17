# vortex:systems/hook/unbind_all
# Clears all hook binds.

execute if data storage vortex:engine modules{hook:0b} run return 0
data modify storage vortex:engine hook_binds set value []
