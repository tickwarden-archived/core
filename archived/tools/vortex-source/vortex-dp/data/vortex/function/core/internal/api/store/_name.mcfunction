# vortex:core/internal/api/store/_name [INTERNAL]
# Validates vortex:store in.name and, when valid, copies it to tmp.k.name (the macro argument
# compound used by every _g_* / _p_* function). RETURN 1 valid, 0 invalid.
data remove storage vortex:store tmp.k
data remove storage vortex:validate in
data modify storage vortex:validate in.value set from storage vortex:store in.name
execute unless function vortex:systems/validate/safe_name run return 0
data modify storage vortex:store tmp.k.name set from storage vortex:store in.name
return 1
