# ======================================================================================
# vortex:core/internal/input/validate/_private/check_tag_safe  [INTERNAL]
# ======================================================================================
# Rejects empty strings and any string containing one of: space " ' { } [ ] : § | ^ < >
# or a literal backslash. A safe result can be used as a scoreboard objective/player-name
# fragment or dropped unquoted into a single NBT string field without escaping.
#
# Double quote and backslash are caught first by core/internal/text/safe; the remaining
# characters come from the deny_tag table via core/internal/text/scan_deny, which looks at
# one character at a time and never substitutes the input as a whole into a command.
# ======================================================================================
execute store result score #vortex.Len vortex.tmp run data get storage vortex:input_validate scratch.value
execute if score #vortex.Len vortex.tmp matches 0 run data modify storage vortex:input_validate result.error set value "empty input"
execute if score #vortex.Len vortex.tmp matches 0 run return 0
data modify storage vortex:text s set from storage vortex:input_validate scratch.value
data modify storage vortex:input_validate scratch.bad set value 0b
execute store result score #vortex.TagSafe vortex.tmp run function vortex:core/internal/text/safe
execute if score #vortex.TagSafe vortex.tmp matches 0 run data modify storage vortex:input_validate scratch.bad set value 1b
data modify storage vortex:text tbl set value "deny_tag"
execute if score #vortex.TagSafe vortex.tmp matches 1 store result score #vortex.TagHit vortex.tmp run function vortex:core/internal/text/scan_deny
execute if score #vortex.TagSafe vortex.tmp matches 1 if score #vortex.TagHit vortex.tmp matches 1 run data modify storage vortex:input_validate scratch.bad set value 1b
data remove storage vortex:text tbl
function vortex:core/internal/text/reset
execute unless data storage vortex:input_validate {scratch:{bad:1b}} run data modify storage vortex:input_validate result.valid set value 1b
execute if data storage vortex:input_validate {scratch:{bad:1b}} run data modify storage vortex:input_validate result.error set value "contains a disallowed character (space, quote, brace, bracket, colon, or backslash)"
data remove storage vortex:input_validate scratch.bad
