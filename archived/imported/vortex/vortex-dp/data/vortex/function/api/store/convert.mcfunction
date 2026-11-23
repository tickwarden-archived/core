# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/store/convert
# Turns the string produced by api/store/render (or any string you put in
# vortex:store out.string) into forms other functions can use. Everything written
# here is a string, int, byte or a list/compound OF strings; no text component is built.
#
# INPUT  vortex:store out.string   a string (a compound or list is rejected)
# OUTPUT vortex:store conv.string      the text as an NBT string
#        vortex:store conv.length      int, number of characters
#        vortex:store conv.lines       list of strings, split on newlines (%nl%)
#        vortex:store conv.line_count  int, entries in conv.lines
#        vortex:store conv.safe        1b when the text has no double quote, backslash,
#                                           newline, carriage return or tab
#        vortex:store conv.macro       {text:"..."}; only set when conv.safe is 1b. Pass it
#                                           with "with storage vortex:store conv.macro" to a
#                                           macro function that uses $(text)
#        vortex:output store.converted mirrors conv.string
# RETURN 1 on success, 0 when out.string is missing or not a string.
#
# Usage:
#   data modify storage vortex:store in set value {template:"Hi %player%%nl%Coins: %score:coins%"}
#   execute as @p run function vortex:api/store/render
#   function vortex:api/store/convert
#   data modify storage mypack:data msg set from storage vortex:store conv.string
execute if data storage vortex:engine modules{store:0b} run return 0
data remove storage vortex:store conv
execute unless data storage vortex:store out.string run return 0
execute if data storage vortex:store out.string{} run return 0
execute if data storage vortex:store out.string[] run return 0

data modify storage vortex:store conv.string set string storage vortex:store out.string
execute store result storage vortex:store conv.length int 1 run data get storage vortex:store conv.string

# lines
data modify storage vortex:text s set from storage vortex:store conv.string
data modify storage vortex:text sep set value "\n"
data modify storage vortex:text keep_empty set value 1b
data modify storage vortex:text n set value 0
execute store result storage vortex:store conv.line_count int 1 run function vortex:core/internal/text/split
data modify storage vortex:store conv.lines set from storage vortex:text out
function vortex:core/internal/text/reset

# macro safety: quote/backslash first (text/safe), then newline/CR/tab (text/ctl)
data modify storage vortex:text s set from storage vortex:store conv.string
execute store result score #st_cv_a vortex.tmp run function vortex:core/internal/text/safe
execute store result score #st_cv_b vortex.tmp run function vortex:core/internal/text/ctl
function vortex:core/internal/text/reset
data modify storage vortex:store conv.safe set value 0b
execute if score #st_cv_a vortex.tmp matches 1 if score #st_cv_b vortex.tmp matches 0 run data modify storage vortex:store conv.safe set value 1b
execute if data storage vortex:store conv{safe:1b} run data modify storage vortex:store conv.macro set value {}
execute if data storage vortex:store conv{safe:1b} run data modify storage vortex:store conv.macro.text set from storage vortex:store conv.string

data modify storage vortex:output store.converted set from storage vortex:store conv.string
return 1
