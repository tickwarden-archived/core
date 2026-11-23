# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:systems/string/score_display
# Sends a formatted label: value line from a scoreboard objective.
#  Input : $(target)    → selector to receive the message
#          $(label)     → display label (e.g. "Points")
#          $(player)    → scoreboard player name (e.g. "@s", "<player name>")
#          $(objective) → scoreboard objective name
#          $(color)     → value color (e.g. "green", "gold")
#
# Example:
# data modify storage vortex:input target set value "@s"
# data modify storage vortex:input label set value "Points"
# data modify storage vortex:input player set value "@s"
# data modify storage vortex:input objective set value "myPoints"
# data modify storage vortex:input color set value "green"
# function vortex:systems/string/score_display with storage vortex:input {}
# Output: "Points 42" (42 from scoreboard)
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{string:0b} run return 0
$tellraw $(target) ["",{"text":"$(label)","color":"gray"},{"text":"  ","color":"#555555"},{"score":{"name":"$(player)","objective":"$(objective)"},"color":"$(color)","bold":true}]
