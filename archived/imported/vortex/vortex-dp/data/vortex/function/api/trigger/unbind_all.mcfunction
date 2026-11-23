# vortex:api/trigger/unbind_all
execute if data storage vortex:engine modules{trigger:0b} run return 0
data modify storage vortex:engine trigger_binds set value []
