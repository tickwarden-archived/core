# EOL entry guard; legacy Minecraft requires each command to be gated.
# Print a short overview of the public API.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s {"text":"TunnelScript - public API (1.19.2)","color":"aqua","bold":true}
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s {"text":"ts:run           -> typed action list (cmd/command only)","color":"gray"}
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s {"text":"ts:run_command   -> { command|cmd } (command block runner)","color":"gray"}
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s {"text":"ts:run_commands  -> { commands:[...] }","color":"gray"}
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s {"text":"ts:batch/*       -> save, load, run, delete, list command presets","color":"gray"}
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s {"text":"ts:config/*      -> set_cooldown, set_max_actions, get, reset","color":"gray"}
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s {"text":"ts:menu          -> open sidebar menu (ts:menu/close to hide)","color":"gray"}
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s {"text":"ts:hologram/*    -> spawn, remove, set_name","color":"gray"}
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s {"text":"ts:input/*       -> minecart input, history, status","color":"gray"}
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s {"text":"ts:dryrun/*      -> on, off, status (preview without executing)","color":"gray"}
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s {"text":"ts:log/*         -> on, off, show, last, clear, set_max","color":"gray"}
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s {"text":"ts:repeat        -> re-run the last executed command","color":"gray"}
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s {"text":"ts:trust/grant   -> allow the caller to request gated actions","color":"gray"}
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s {"text":"ts:trust/revoke  -> remove that permission from the caller","color":"gray"}
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s {"text":"ts:gate/yes      -> confirm the pending gated action (30s to confirm)","color":"gray"}
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s {"text":"ts:gate/cancel   -> cancel the pending gated action","color":"gray"}
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s {"text":"ts_util:*        -> math, data, time helpers","color":"gray"}
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s {"text":"/trigger tunnelScript.use set <n> -> 1 version, 2 help,","color":"gray"}
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s {"text":"   3 run, 4 run_command, 5 run_commands, 6 config/get, 7 config/reset,","color":"gray"}
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s {"text":"   8 dryrun/status, 9 log/show, 10 repeat","color":"gray"}
# Macro-only features (run_function with args, run_if, run_as, run_after, dialog) are 1.21.6+.
execute if data storage vf_eol_601484f105:lifecycle {phase:1} run tellraw @s [{"text":"[TunnelScript] ","color":"aqua"},{"text":"'macro features' needs Minecraft 1.20.2+ (function macros). ","color":"gray"},{"text":"Click here for the 1.21.6 build.","color":"yellow","underlined":true,"clickEvent":{"action":"open_url","value":"https://github.com/vortaforge/core/tree/main/packs/TunnelScript"},"hoverEvent":{"action":"show_text","value":[{"text":"https://github.com/vortaforge/core/tree/main/packs/TunnelScript","color":"gray"}]}}]
