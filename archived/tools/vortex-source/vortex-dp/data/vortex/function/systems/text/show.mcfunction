# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:systems/text/show [MACRO]
# Prints one NBT value to the caller, rendered as plain text.
#
# INPUT: $(storage) — storage namespace, e.g. "vortex:engine"
#        $(path)    — NBT path inside it, e.g. "flags"
#
# Both `plain` and `interpret` are set explicitly, and that is the whole
# point of this helper. On 26.1+ a component that reads NBT renders:
#
#   {"storage":...,"nbt":...}                            "Example Text"
#   {...,"interpret":true}                                Example Text
#   {...,"interpret":false,"plain":true}                  Example Text
#
# The first form keeps the quotes, which is almost never what a caller
# wants. `plain` also strips vanilla's colouring and type suffix from
# numbers and booleans, so a stored 1b prints as 1 rather than a coloured
# 1b. Leaving either key out is what makes output depend on the stored
# value's type.
#
# Usage:  function vortex:systems/text/show {storage:"vortex:engine",path:"flags"}
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{text:0b} run return 0
$tellraw @s [{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"storage":"$(storage)","nbt":"$(path)","plain":true,"interpret":false,"color":"white"}]
