# ─────────────────────────────────────────────────────────────────
# vortex:systems/text/show_to [MACRO]
# As systems/text/show, but to an arbitrary selector.
#
# INPUT: $(storage), $(path), $(target)
#
# Usage:  function vortex:systems/text/show_to {storage:"vortex:engine",path:"flags",target:"@a[tag=vortex.admin]"}
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{text:0b} run return 0
$tellraw $(target) [{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"storage":"$(storage)","nbt":"$(path)","plain":true,"interpret":false,"color":"white"}]
