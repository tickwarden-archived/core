# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# macroengine:systems/text/show_to [MACRO]
# As systems/text/show, but to an arbitrary selector.
#
# INPUT: $(storage), $(path), $(target)
#
# Usage:  function macroengine:systems/text/show_to {storage:"macroengine:engine",path:"flags",target:"@a[tag=macroengine.admin]"}
# ─────────────────────────────────────────────────────────────────

execute if data storage macroengine:engine modules{text:0b} run return 0
$tellraw $(target) [{"text":"[MACROENGINE] ","color":"#00AAAA","bold":true},{"storage":"$(storage)","nbt":"$(path)","plain":true,"interpret":false,"color":"white"}]
