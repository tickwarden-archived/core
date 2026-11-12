# vortex:core/internal/load/final
function vortex:core/version/define
function #vortex:init
data modify storage vortex:engine global.loaded set value 1b
tellraw @s [{"text":"[VORTEX]","color":"dark_aqua","italic":false}," ",{"text":"Loaded!","italic":false,"color":"green"}]
