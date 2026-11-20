# ─────────────────────────────────────────────────────────────────
# vortex:systems/hook/bind
# Binds a function or command to a specific event.
# Multiple binds can be added to the same event.
#
# INPUT (storage vortex:input):
# event → event name: "player_join" | "player_death" | "player_respawn"
# "level_up" | "block_place" | "block_break" | "item_use"
# func → (optional) function to run — as the triggering player
# cmd → (optional) command to run — used if func is absent
#
# EXAMPLE:
# data modify storage vortex:input event set value "player_death"
# data modify storage vortex:input func set value "mypack:on_death"
# function vortex:systems/hook/bind
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{hook:0b} run return 0
function vortex:core/internal/systems/hook/bind_exec with storage vortex:input {}
