# vortex:player/get/dimension [MACRO]
data remove storage vortex:output result
$data modify storage vortex:output result set from entity @a[name=$(player),limit=1] Dimension
