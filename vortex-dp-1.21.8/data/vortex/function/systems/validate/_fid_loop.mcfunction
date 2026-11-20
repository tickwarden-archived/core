# vortex:systems/validate/_fid_loop [INTERNAL]
# Checks every entry of vortex:validate fid.segs with safe_name (an empty entry fails).
execute unless data storage vortex:validate fid.segs[0] run return 1
data remove storage vortex:validate in
data modify storage vortex:validate in.value set from storage vortex:validate fid.segs[0]
execute unless function vortex:systems/validate/safe_name run return 0
data remove storage vortex:validate fid.segs[0]
return run function vortex:systems/validate/_fid_loop
