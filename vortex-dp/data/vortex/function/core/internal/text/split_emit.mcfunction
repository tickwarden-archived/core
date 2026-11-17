# vortex:core/internal/text/split_emit [INTERNAL] appends win to out unless it is empty and empties are dropped
execute store result score #tx_wl vortex.tmp run data get storage vortex:text win
execute if score #tx_wl vortex.tmp matches 1.. run data modify storage vortex:text out append from storage vortex:text win
execute if score #tx_wl vortex.tmp matches 0 if score #tx_keep vortex.tmp matches 1 run data modify storage vortex:text out append from storage vortex:text win
