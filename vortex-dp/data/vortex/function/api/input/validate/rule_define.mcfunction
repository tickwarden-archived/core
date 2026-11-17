# vortex:api/input/validate/rule_define [MACRO]
# Defines (or replaces) a named input rule. Rules never block anything by themselves:
# YOUR datapack calls input/validate/rule and acts on the answer.
# AI-assisted: written with Claude (Anthropic); see CREDITS.md.
#
# INPUT (macro args): name  rule name, letters/digits/underscore, e.g. "yesno"
#                     rule  SNBT compound with any of:
#       allow        list of accepted values: the input must equal one of them
#       deny         list of refused values: the input must equal none of them
#       ignore_case  1b = compare ASCII letters without case ("YES" matches "yes")
#     List entries may be strings or numbers (1 is compared as "1").
# name/rule are written by the datapack author, not by players.
#
# Usage:
#   function vortex:api/input/validate/rule_define {name:"yesno",rule:{allow:["yes","no"],ignore_case:1b}}
#   function vortex:api/input/validate/rule_define {name:"bit",rule:{allow:[0,1]}}
#   function vortex:api/input/validate/rule_define {name:"no_admin",rule:{deny:["admin","owner"],ignore_case:1b}}

$data modify storage vortex:input_validate rules.$(name) set value $(rule)
