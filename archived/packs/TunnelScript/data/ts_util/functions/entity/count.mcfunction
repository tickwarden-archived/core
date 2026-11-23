# EOL entry guard; legacy Minecraft requires each command to be gated.
# ts_util:entity/count is not available on the 1.19.2 build: it relies on function macros,
# which Minecraft only added in 1.20.2. This stub explains the limitation and
# points the player at the 1.21.6 build instead (clickable GitHub link).
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s [{"text":"[TunnelScript] ","color":"aqua"},{"text":"'ts_util:entity/count' needs Minecraft 1.20.2+ (function macros). ","color":"gray"},{"text":"Dynamic selectors need macros.  ","color":"gray"},{"text":"Click here for the 1.21.6 build.","color":"yellow","underlined":true,"clickEvent":{"action":"open_url","value":"https://github.com/vortaforge/core/tree/main/packs/TunnelScript"},"hoverEvent":{"action":"show_text","value":[{"text":"https://github.com/vortaforge/core/tree/main/packs/TunnelScript","color":"gray"}]}}]
