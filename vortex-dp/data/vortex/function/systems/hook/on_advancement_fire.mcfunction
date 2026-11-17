# ─────────────────────────────────────────────────────────────────
# vortex:systems/hook/on_advancement_fire
# Called from the user's own advancement reward function.
# Fires an event in "advancement:<id>" format.
#
# INPUT (storage vortex:input):
# advancement → advancement ID (e.g. "story/mine_stone")
#
# USAGE:
# 1) Define a function as the reward in your advancement JSON:
# "rewards": {"function": "mypack:advancements/mine_stone"}
#
# 2) Inside that function:
# data modify storage vortex:input advancement set value "story/mine_stone"
# function vortex:systems/hook/on_advancement_fire
#
# 3) Hook bind:
# data modify storage vortex:input event set value "advancement:story/mine_stone"
# data modify storage vortex:input func set value "mypack:on_first_mine"
# function vortex:systems/hook/bind
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{hook:0b} run return 0
function vortex:core/internal/systems/hook/on_advancement_fire with storage vortex:input {}
