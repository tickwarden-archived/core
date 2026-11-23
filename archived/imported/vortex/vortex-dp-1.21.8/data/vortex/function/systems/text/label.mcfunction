# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:systems/text/label [MACRO]
# Prints "label: value" for one NBT value, so list-style output does not
# have to hand-build the same component every time.
#
# INPUT: $(label), $(storage), $(path)
#
# Usage:  function vortex:systems/text/label {label:"flags",storage:"vortex:engine",path:"flags"}
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{text:0b} run return 0
$tellraw @s [{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"$(label)","color":"gray"},{"text":": ","color":"#555555"},{"storage":"$(storage)","nbt":"$(path)","plain":true,"interpret":false,"color":"white"}]
