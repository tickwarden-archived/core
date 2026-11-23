# vortex:api/perm/trigger/clear [MACRO]
execute if data storage vortex:engine modules{perm:0b} run return 0
$data remove storage vortex:engine perm_triggers.$(name)
