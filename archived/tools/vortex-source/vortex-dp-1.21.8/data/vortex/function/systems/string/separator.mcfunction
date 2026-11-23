# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:systems/string/separator
# Sends a decorative horizontal separator line.
#  Input : $(target) → selector
#          $(color)  → line color (e.g. "gray", "aqua", "#555555")
#          $(label)  → optional center label (use "" for plain line)
#
# Example (plain line):
# data modify storage vortex:input target set value "@s"
# data modify storage vortex:input color set value "gray"
# data modify storage vortex:input label set value ""
# function vortex:systems/string/separator with storage vortex:input {}
#
# Example (labeled):
# data modify storage vortex:input label set value " Settings "
# function vortex:systems/string/separator with storage vortex:input {}
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{string:0b} run return 0
$tellraw $(target) ["",{"text":"──────────","color":"$(color)"},{"text":"$(label)","color":"$(color)","bold":true},{"text":"──────────","color":"$(color)"}]
