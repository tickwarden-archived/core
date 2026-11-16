# vortex:core/internal/core/lib/fiber/is_alive_exec [MACRO]
# INPUT: $(id)

data modify storage vortex:output result set value 0b
$execute if data storage vortex:engine fibers.$(id){alive:1b} run data modify storage vortex:output result set value 1b
