# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:systems/diagnostics/checks/module_one [MACRO: name]
# Internal: checks one module. $(name) comes only from the constant list in checks/modules.
# Codes: module.missing:<name>  module.invalid:<name>  module.mismatch:<name>

$execute unless data storage vortex:engine modules.$(name) run data modify storage vortex:output diagnostics.issues append value "module.missing:$(name)"
$execute if data storage vortex:engine modules{$(name):1b} run scoreboard players add #vortex.dg_on vortex.tmp 1
$execute if data storage vortex:engine modules{$(name):0b} run scoreboard players add #vortex.dg_off vortex.tmp 1
$execute if data storage vortex:engine modules.$(name) unless data storage vortex:engine modules{$(name):1b} unless data storage vortex:engine modules{$(name):0b} run data modify storage vortex:output diagnostics.issues append value "module.invalid:$(name)"
$execute if data storage vortex:engine modules{$(name):1b} unless data storage vortex:engine config{module_$(name):1b} run data modify storage vortex:output diagnostics.issues append value "module.mismatch:$(name)"
$execute if data storage vortex:engine modules{$(name):0b} unless data storage vortex:engine config{module_$(name):0b} run data modify storage vortex:output diagnostics.issues append value "module.mismatch:$(name)"
