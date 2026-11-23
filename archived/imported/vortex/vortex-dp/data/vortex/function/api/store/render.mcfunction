# vortex:api/store/render
# Fills a template and returns a PLAIN STRING (no text component, no tellraw).
#
# INPUT  vortex:store in.template (string)   template text, OR
#        vortex:store in.name     (string)   id stored with api/store/text/define
#        vortex:store in.lang     (string)   optional; fallback order described in _find_tpl
#        vortex:store in.args     (compound) optional; values are strings or numbers
# OUTPUT vortex:store out.string  the result;  vortex:output store.string mirrors it
# RETURN 1 on success, 0 when the template is missing/invalid or an argument is not
#        a string or number.
#
# Syntax inside a template
#   %name%         value of in.args.name
#   %g:name%       global value (api/store/set)
#   %p:name%       per-player value of the executor (api/store/player/set)
#   %score:obj%    scoreboard value of the executor
#   %player%       executor name        %nl%  line break        %%  a literal percent
#   %health% %food% %xp_level% %dimension%   executor values (players only), as strings
#   Unknown or unclosed %...% stays as written. Nested %...% inside values is not parsed.
# Plain strings in, plain strings out. Nothing here ever builds a text component.
# Names are checked with systems/validate/safe_name while they are still data in storage,
# before they reach a macro line (see api/perm/require for the same pattern).
execute if data storage vortex:engine modules{store:0b} run return 0
data remove storage vortex:store out.string
data remove storage vortex:store tmp
execute if data storage vortex:store in.template run data modify storage vortex:store tmp.tpl set from storage vortex:store in.template
execute unless data storage vortex:store tmp.tpl unless function vortex:core/internal/api/store/_name run return 0
execute unless data storage vortex:store tmp.tpl run function vortex:core/internal/api/store/_find_tpl
execute unless data storage vortex:store tmp.tpl run return 0

execute store result score #st_n vortex.tmp run data get storage vortex:store tmp.tpl
execute store result score #st_max vortex.tmp run data get storage vortex:engine config.store_max_template
execute if score #st_max vortex.tmp matches ..0 run scoreboard players set #st_max vortex.tmp 8192
execute if score #st_n vortex.tmp > #st_max vortex.tmp run return 0
data modify storage vortex:text s set from storage vortex:store tmp.tpl
data modify storage vortex:text sep set value "%"
data modify storage vortex:text keep_empty set value 1b
data modify storage vortex:text n set value 0
function vortex:core/internal/text/split
data modify storage vortex:store tmp.segs set from storage vortex:text out
function vortex:core/internal/text/reset
execute store result score #st_n vortex.tmp run data get storage vortex:store tmp.segs
execute store result score #st_max vortex.tmp run data get storage vortex:engine config.store_max_tokens
execute if score #st_max vortex.tmp matches ..0 run scoreboard players set #st_max vortex.tmp 128
scoreboard players operation #st_max vortex.tmp += #st_max vortex.tmp
scoreboard players add #st_max vortex.tmp 1
execute if score #st_n vortex.tmp > #st_max vortex.tmp run return 0

data modify storage vortex:store tmp.frags set value []
scoreboard players set #st_mode vortex.tmp 0
function vortex:core/internal/api/store/_loop
data remove storage vortex:store tmp.segs

data modify storage vortex:text list set from storage vortex:store tmp.frags
data modify storage vortex:store out.string set value ""
execute unless data storage vortex:store tmp.frags[0] run data remove storage vortex:text list
execute unless data storage vortex:store tmp.frags[0] run data modify storage vortex:store out.ok set value 1b
execute if data storage vortex:store tmp.frags[0] store success score #st_cc vortex.tmp run function vortex:core/internal/text/concat
execute if data storage vortex:store tmp.frags[0] if score #st_cc vortex.tmp matches 0 run data modify storage vortex:store out.ok set value 0b
execute if data storage vortex:store tmp.frags[0] if score #st_cc vortex.tmp matches 1 run data modify storage vortex:store out.ok set value 1b
execute if data storage vortex:text out run data modify storage vortex:store out.string set from storage vortex:text out
function vortex:core/internal/text/reset
data modify storage vortex:output store.string set from storage vortex:store out.string
data remove storage vortex:store tmp
execute if data storage vortex:store out{ok:1b} run return 1
return 0
