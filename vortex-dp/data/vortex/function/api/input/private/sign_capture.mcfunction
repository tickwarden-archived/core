# ======================================================================================
# vortex:api/input/private/sign_capture  [INTERNAL]
# MC 26.3-pre-3
# Strategy: copy block entity → extract from storage (more reliable than direct paths).
# messages[i] may be: plain string | {text:"..."} | JSON-string component
# ======================================================================================

data modify storage vortex:input sign set value {raw:"",lines:["","","",""],found:1b}

# Snapshot entire block entity at ray hit
data modify storage vortex:input sign.be set from block ~ ~ ~

# Prefer front_text, else 26.3 component
data modify storage vortex:input sign.front set value {}
data modify storage vortex:input sign.front set from storage vortex:input sign.be.front_text
execute unless data storage vortex:input sign.front.messages run data modify storage vortex:input sign.front set from storage vortex:input sign.be.components."minecraft:sign_text_front"
execute unless data storage vortex:input sign.front.messages run data modify storage vortex:input sign.front set from storage vortex:input sign.be.components.minecraft:sign_text_front

# ---- extract each line into sign.lines[i] as best-effort string ----
# line 0
data modify storage vortex:input _t set value ""
data modify storage vortex:input _t set from storage vortex:input sign.front.messages[0].text
execute if data storage vortex:input {_t:""} run data modify storage vortex:input _t set from storage vortex:input sign.front.messages[0]
data modify storage vortex:input sign.lines[0] set from storage vortex:input _t
# line 1
data modify storage vortex:input _t set value ""
data modify storage vortex:input _t set from storage vortex:input sign.front.messages[1].text
execute if data storage vortex:input {_t:""} run data modify storage vortex:input _t set from storage vortex:input sign.front.messages[1]
data modify storage vortex:input sign.lines[1] set from storage vortex:input _t
# line 2
data modify storage vortex:input _t set value ""
data modify storage vortex:input _t set from storage vortex:input sign.front.messages[2].text
execute if data storage vortex:input {_t:""} run data modify storage vortex:input _t set from storage vortex:input sign.front.messages[2]
data modify storage vortex:input sign.lines[2] set from storage vortex:input _t
# line 3
data modify storage vortex:input _t set value ""
data modify storage vortex:input _t set from storage vortex:input sign.front.messages[3].text
execute if data storage vortex:input {_t:""} run data modify storage vortex:input _t set from storage vortex:input sign.front.messages[3]
data modify storage vortex:input sign.lines[3] set from storage vortex:input _t

# raw = first non-empty line
data modify storage vortex:input sign.raw set from storage vortex:input sign.lines[0]
data modify storage vortex:input _t set from storage vortex:input sign.raw
execute if data storage vortex:input {_t:""} run data modify storage vortex:input sign.raw set from storage vortex:input sign.lines[1]
data modify storage vortex:input _t set from storage vortex:input sign.raw
execute if data storage vortex:input {_t:""} run data modify storage vortex:input sign.raw set from storage vortex:input sign.lines[2]
data modify storage vortex:input _t set from storage vortex:input sign.raw
execute if data storage vortex:input {_t:""} run data modify storage vortex:input sign.raw set from storage vortex:input sign.lines[3]

data remove storage vortex:input _t
data modify storage vortex:input sign.player set from entity @s UUID
data modify storage vortex:input sign.pos set from entity @s Pos
data modify storage vortex:input sign.executed set value 0b
execute if data storage vortex:input sign{executed:0b} run function #vortex:input/sign
