# vortex:systems/validate/function_id
# Checks a function id ("namespace:path/to/function") WHILE IT IS STILL DATA, before it can reach a
# `$function $(...)` line. Same idea as safe_name, which refuses ':' and '/', so the id is cut at
# ':' and '/' and every piece must pass safe_name.
# INPUT  vortex:validate in.value   OUTPUT vortex:validate out.valid (1b/0b), out.error
# RETURN 1 when valid, 0 when not. Tags (#ns:tag) are refused on purpose.
# USAGE  data remove storage vortex:validate in
#        data modify storage vortex:validate in.value set value "mypack:on_insert"
#        execute if function vortex:systems/validate/function_id run ...
data modify storage vortex:validate out set value {valid:0b}
data remove storage vortex:validate fid
data modify storage vortex:validate fid.v set string storage vortex:validate in.value
execute unless data storage vortex:validate fid.v run data modify storage vortex:validate out.error set value "no value"
execute unless data storage vortex:validate fid.v run return 0
data modify storage vortex:text s set from storage vortex:validate fid.v
data modify storage vortex:text sep set value ":"
data modify storage vortex:text keep_empty set value 1b
execute store result score #fid_n vortex.tmp run function vortex:core/internal/text/split
data modify storage vortex:validate fid.parts set from storage vortex:text out
data remove storage vortex:text sep
data remove storage vortex:text keep_empty
data remove storage vortex:text out
function vortex:core/internal/text/reset
execute unless score #fid_n vortex.tmp matches 2 run data modify storage vortex:validate out.error set value "expected namespace:path"
execute unless score #fid_n vortex.tmp matches 2 run return 0
data modify storage vortex:validate fid.segs set value []
data modify storage vortex:validate fid.segs append from storage vortex:validate fid.parts[0]
execute unless function vortex:systems/validate/_fid_loop run data modify storage vortex:validate out.error set value "bad namespace"
execute if data storage vortex:validate out.error run return 0
data modify storage vortex:text s set from storage vortex:validate fid.parts[1]
data modify storage vortex:text sep set value "/"
data modify storage vortex:text keep_empty set value 1b
function vortex:core/internal/text/split
data modify storage vortex:validate fid.segs set from storage vortex:text out
data remove storage vortex:text sep
data remove storage vortex:text keep_empty
data remove storage vortex:text out
function vortex:core/internal/text/reset
execute unless function vortex:systems/validate/_fid_loop run data modify storage vortex:validate out.error set value "bad path segment"
execute if data storage vortex:validate out.error run return 0
data modify storage vortex:validate out set value {valid:1b}
data remove storage vortex:validate fid
return 1
