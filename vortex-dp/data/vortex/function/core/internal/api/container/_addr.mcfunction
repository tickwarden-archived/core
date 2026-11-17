# vortex:core/internal/api/container/_addr [INTERNAL]
# Builds vortex:container tmp.k {x,y,z[,slot][,slot2][,tx,ty,tz]} from vortex:input.
# Every value is checked as a NUMBER first (see _num). RETURN 1 valid, 0 invalid.
data remove storage vortex:container tmp.k
scoreboard players set #vortex.chk vortex.tmp 0
execute store result score #vortex.chk vortex.tmp run function vortex:core/internal/api/container/_pos {x:"x",y:"y",z:"z"}
execute unless score #vortex.chk vortex.tmp matches 1.. run return 0
scoreboard players set #vortex.chk vortex.tmp 0
execute if data storage vortex:input slot store result score #vortex.chk vortex.tmp run function vortex:core/internal/api/container/_slot {f:"slot"}
execute if data storage vortex:input slot unless score #vortex.chk vortex.tmp matches 1.. run return 0
scoreboard players set #vortex.chk vortex.tmp 0
execute if data storage vortex:input slot2 store result score #vortex.chk vortex.tmp run function vortex:core/internal/api/container/_slot {f:"slot2"}
execute if data storage vortex:input slot2 unless score #vortex.chk vortex.tmp matches 1.. run return 0
scoreboard players set #vortex.chk vortex.tmp 0
execute if data storage vortex:input tx store result score #vortex.chk vortex.tmp run function vortex:core/internal/api/container/_pos {x:"tx",y:"ty",z:"tz"}
execute if data storage vortex:input tx unless score #vortex.chk vortex.tmp matches 1.. run return 0
return 1
