# vortex:core/internal/api/store/_loop [INTERNAL]
# Walks tmp.segs, which alternate text, name, text, name ... (#st_mode 0 = text, 1 = name).
execute unless data storage vortex:store tmp.segs[0] run return 0
execute if score #st_mode vortex.tmp matches 0 run function vortex:core/internal/api/store/_step_text
execute unless data storage vortex:store tmp.segs[0] run return 0
execute if score #st_mode vortex.tmp matches 1 run function vortex:core/internal/api/store/_step_name
function vortex:core/internal/api/store/_loop
