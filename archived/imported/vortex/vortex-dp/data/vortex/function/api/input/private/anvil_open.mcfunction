# vortex:api/input/private/anvil_open  [INTERNAL]
# Reward of the vortex:input/anvil_open advancement. @s = player who just
# opened an anvil. Starts (or restarts) the anvil session; see input/anvil.
advancement revoke @s only vortex:input/anvil_open
tag @s add vortex.anvil_session
tag @s remove vortex.anvil_hidden
scoreboard players set @s vortex.anvil_t 0
