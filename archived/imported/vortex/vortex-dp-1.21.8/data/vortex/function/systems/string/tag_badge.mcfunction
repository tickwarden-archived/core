# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:systems/string/tag_badge
# Sends a styled [TAG] badge with optional hover text.
#  Input : $(target)     → selector
#          $(tag)        → badge label (e.g. "ADMIN", "VIP")
#          $(color)      → badge color (e.g. "red", "gold")
#          $(hover)      → hover tooltip text
#
# Example:
# data modify storage vortex:input target set value "@s"
# data modify storage vortex:input tag set value "ADMIN"
# data modify storage vortex:input color set value "red"
# data modify storage vortex:input hover set value "Server Administrator"
# function vortex:systems/string/tag_badge with storage vortex:input {}
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{string:0b} run return 0
$tellraw $(target) ["",{"text":"[","color":"#555555","bold":false},{"text":"$(tag)","color":"$(color)","bold":true,"hover_event":{"action":"show_text","value":{"text":"$(hover)","color":"gray","italic":true}}},{"text":"]","color":"#555555","bold":false}]
