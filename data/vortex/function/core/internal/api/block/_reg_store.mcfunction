# vortex:core/internal/api/block/_reg_store [INTERNAL, MACRO: id]
$data modify storage vortex:engine block_registry."$(id)" set from storage vortex:block tmp.reg
return 1
