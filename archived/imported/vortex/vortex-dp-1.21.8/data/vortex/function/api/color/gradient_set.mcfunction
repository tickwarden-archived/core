# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/color/gradient_set [MACRO]
# Registers a named gradient as an ordered list of color strings.
# Steps are accessed by index via vortex:api/color/lerp.
#
# Input (macro args):
#   name   — gradient name (e.g. "health", "sunset", "xp")
#   colors — SNBT list of color strings, e.g. ["red","yellow","green"]
#            or hex: ["#FF0000","#FFAA00","#00FF00"]
#            Length is arbitrary; step 0 = first entry.
#
# Output → none
#
# Usage:
#   function vortex:api/color/gradient_set {name:"health",\
#     colors:["red","yellow","green"]}
#
#   function vortex:api/color/gradient_set {name:"xp",\
#     colors:["dark_green","green","#AAFF00","yellow"]}
#
# Note: SNBT list syntax requires quotes around string entries.
# This is a load-time operation — call from a load tag or init function.

execute if data storage vortex:engine modules{color:0b} run return 0
execute unless data storage vortex:engine color.gradients run data modify storage vortex:engine color.gradients set value {}
$data modify storage vortex:engine color.gradients.$(name) set value $(colors)
