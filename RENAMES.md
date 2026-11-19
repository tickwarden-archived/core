# Renames

## Project rename (0.1.0)

Namespace changed from `macroengine:` to `vortex:`; every path after the colon is
unchanged, so this is not listed row by row below. Scoreboard objectives and tags
moved the same way: `macroengine.*` to `vortex.*`. One stale comment
(`init_from_nmacroengine`, a leftover from an earlier careless rename) was fixed
to `init_from_name`; the actual function call there was never affected.
Scoreboard keys starting with `vortacraftmc.` are untouched on purpose - they are
the source side of a world-data migration (see `core/config/init.mcfunction`), not
branding, and must keep matching whatever a pre-existing world already has on disk.

Every function ID not listed here is unchanged. IDs are `vortex:<path>`.

Frozen on purpose: `api/cmd/*` (dispatched dynamically by `api/cmd/$(type)`), `api/perm/*` advancements, and all function tags under `tags/function/`.

## Namespace discipline rename (0.4.0)

No name ships without the pack prefix anymore (enforced by
`scripts/check-namespace.mjs` in CI). Function IDs did not change; the
scoreboard objectives, entity tags and fake-player holders below did.
Scores stored under the old objective names cannot be migrated in code —
they stay in orphaned objectives until removed manually
(`scoreboard objectives remove <old name>`).

| Old | New |
|---|---|
| `player_action.*` (objectives and entity tags) | `vortex.player_action.*` |
| `load.status` (objective) | `vortex.load_status` |
| `#player_action.*` (fake-player holders) | `#vortex.player_action.*` |

## Functions

| Old | New |
|---|---|
| `core/internal/core/lib/for_each_list` | `core/internal/core/lib/for_each/list` |
| `core/internal/core/lib/for_each_list_call` | `core/internal/core/lib/for_each/list_call` |
| `core/internal/core/lib/for_each_list_step` | `core/internal/core/lib/for_each/list_step` |
| `core/internal/core/lib/queue_fire` | `core/internal/core/lib/queue/fire` |
| `core/internal/core/lib/queue_run_cmd` | `core/internal/core/lib/queue/run_cmd` |
| `core/internal/core/lib/queue_run_cmd_as` | `core/internal/core/lib/queue/run_cmd_as` |
| `core/internal/core/lib/queue_run_func` | `core/internal/core/lib/queue/run_func` |
| `core/internal/core/lib/queue_run_func_as` | `core/internal/core/lib/queue/run_func_as` |
| `core/internal/core/lib/repeat_call` | `core/internal/core/lib/repeat/call` |
| `core/internal/core/lib/repeat_n_call` | `core/internal/core/lib/repeat/times_call` |
| `core/internal/core/lib/repeat_n_loop` | `core/internal/core/lib/repeat/times_loop` |
| `core/internal/core/lib/repeat_run` | `core/internal/core/lib/repeat/run` |
| `core/internal/core/lib/schedule_requeue` | `core/internal/core/lib/schedule/requeue` |
| `core/internal/core/lib/schedule_requeue_as` | `core/internal/core/lib/schedule/requeue_as` |
| `core/internal/core/lib/schedule_requeue_cmd` | `core/internal/core/lib/schedule/requeue_cmd` |
| `core/internal/core/lib/schedule_requeue_cmd_as` | `core/internal/core/lib/schedule/requeue_cmd_as` |
| `core/internal/core/lib/schedule_reset_do` | `core/internal/core/lib/schedule/reset_do` |
| `core/internal/core/lib/schedule_reset_do_as` | `core/internal/core/lib/schedule/reset_do_as` |
| `core/internal/core/lib/schedule_reset_do_cmd` | `core/internal/core/lib/schedule/reset_do_cmd` |
| `core/internal/core/lib/schedule_reset_do_cmd_as` | `core/internal/core/lib/schedule/reset_do_cmd_as` |
| `core/lib/debounce` | `core/lib/debounce/run` |
| `core/lib/debounce_cmd` | `core/lib/debounce/cmd` |
| `core/lib/for_each_entity` | `core/lib/for_each/entity` |
| `core/lib/for_each_list` | `core/lib/for_each/list` |
| `core/lib/for_each_player` | `core/lib/for_each/player` |
| `core/lib/for_each_player_at` | `core/lib/for_each/player_at` |
| `core/lib/once` | `core/lib/once/run` |
| `core/lib/once_cmd` | `core/lib/once/cmd` |
| `core/lib/once_per_player` | `core/lib/once/per_player` |
| `core/lib/once_per_player_reset` | `core/lib/once/per_player_reset` |
| `core/lib/process_queue` | `core/lib/queue/process` |
| `core/lib/queue_add` | `core/lib/queue/add` |
| `core/lib/queue_add_as` | `core/lib/queue/add_as` |
| `core/lib/queue_add_cmd` | `core/lib/queue/add_cmd` |
| `core/lib/queue_clear` | `core/lib/queue/clear` |
| `core/lib/repeat` | `core/lib/repeat/run` |
| `core/lib/repeat_as` | `core/lib/repeat/run_as` |
| `core/lib/repeat_n` | `core/lib/repeat/times` |
| `core/lib/schedule_as` | `core/lib/schedule/run_as` |
| `core/lib/schedule_cancel` | `core/lib/schedule/cancel` |
| `core/lib/schedule_cmd` | `core/lib/schedule/cmd` |
| `core/lib/schedule_cmd_as` | `core/lib/schedule/cmd_as` |
| `core/lib/schedule_if` | `core/lib/schedule/run_if` |
| `core/lib/schedule_if_cmd` | `core/lib/schedule/cmd_if` |
| `core/lib/schedule_list` | `core/lib/schedule/list` |
| `core/lib/schedule_renew` | `core/lib/schedule/renew` |
| `core/lib/schedule_reset` | `core/lib/schedule/reset` |
| `core/lib/wait` | `core/lib/wait/run` |
| `core/lib/wait_as` | `core/lib/wait/run_as` |
| `core/lib/wait_cmd` | `core/lib/wait/cmd` |
| `core/lib/wait_cmd_as` | `core/lib/wait/cmd_as` |
| `input/give_anvil` | `input/give/anvil` |
| `input/give_anvil_custom` | `input/give/anvil_custom` |
| `input/give_name_tag` | `input/give/name_tag` |
| `input/give_writable_book` | `input/give/writable_book` |
| `input/summon_cbm` | `input/summon/command_block_minecart` |
| `player/add_default` | `player/var/add_default` |
| `player/add_to_var` | `player/var/add` |
| `player/add_var_clamped` | `player/var/add_clamped` |
| `player/clamp_var` | `player/var/clamp` |
| `player/copy_var` | `player/var/copy` |
| `player/decrement` | `player/var/decrement` |
| `player/del_var` | `player/var/delete` |
| `player/get_air` | `player/get/air` |
| `player/get_armor` | `player/get/armor` |
| `player/get_dimension` | `player/get/dimension` |
| `player/get_food` | `player/get/food` |
| `player/get_gamemode` | `player/get/gamemode` |
| `player/get_health` | `player/get/health` |
| `player/get_name` | `player/get/name` |
| `player/get_online_count` | `player/get/online_count` |
| `player/get_pos` | `player/get/pos` |
| `player/get_var` | `player/var/get` |
| `player/get_xp` | `player/get/xp` |
| `player/has_var` | `player/var/has` |
| `player/increment` | `player/var/increment` |
| `player/is_burning` | `player/is/burning` |
| `player/is_flying` | `player/is/flying` |
| `player/is_gliding` | `player/is/gliding` |
| `player/is_in_water` | `player/is/in_water` |
| `player/is_on_ground` | `player/is/on_ground` |
| `player/is_online` | `player/is/online` |
| `player/is_sneaking` | `player/is/sneaking` |
| `player/is_sprinting` | `player/is/sprinting` |
| `player/list_vars` | `player/var/list` |
| `player/run_cmd_as_uuid_macro` | `player/run/cmd_as_uuid` |
| `player/run_func_as_uuid_macro` | `player/run/func_as_uuid` |
| `player/set_var` | `player/var/set` |
| `player/swap_var` | `player/var/swap` |
| `player/toggle_var` | `player/var/toggle` |
| `player/transfer_var` | `player/var/transfer` |
| `world/block_if` | `world/block/run_if` |
| `world/block_unless` | `world/block/run_unless` |
| `world/clone_to` | `world/region/clone` |
| `world/fill_hollow` | `world/region/fill_hollow` |
| `world/fill_keep` | `world/region/fill_keep` |
| `world/fill_outline` | `world/region/fill_outline` |
| `world/fill_replace` | `world/region/fill_replace` |
| `world/get_time` | `world/time/get` |
| `world/setblock_if` | `world/block/set_if` |
| `world/time_phase` | `world/time/phase` |

## Storages

| Old | New |
|---|---|
| `vortex:_item_tmp` | `vortex:item_tmp` |
| `vortex:rl_work` | `vortex:rate_limit` |
| `vortex:core/internal/player/temp` | `vortex:player_tmp` |

## Scores, tags and keys

| Old | New | Kind |
|---|---|---|
| `vortex.Flags` | `vortex.flags` | scoreboard objective |
| `vortex.rightClick` | `vortex.right_click` | scoreboard objective |
| `vortex_action` | `vortex.action` | trigger objective |
| `vortex_run` | `vortex.run` | trigger objective |
| `vortex_input` | `vortex.input` | entity tag |
| `customData` | `custom_data` | macro / storage key |


## Restructure 0.4.0: module layout

Top-level `player/`, `input/` and `tui/` moved under `api/`. The `core/` modules `cooldown`, `state`, `queue` and `lib` split: callers outside `core/` see public entry points under `api/` (`cooldown`, `state`, `queue`) or `systems/lib/` (`lib`); helpers and handlers moved under `core/internal/core/`. Function IDs below changed, so update callers. Storage, scoreboard and tag IDs did not change; tags under `tags/function/` were kept in place and only their function members were rewritten.

| Old | New |
|---|---|
| `core/cooldown/check` | `core/internal/core/cooldown/check` |
| `core/cooldown/clear` | `api/cooldown/clear` |
| `core/cooldown/clear_all` | `api/cooldown/clear_all` |
| `core/cooldown/detail` | `api/cooldown/detail` |
| `core/cooldown/extend` | `api/cooldown/extend` |
| `core/cooldown/is_ready` | `api/cooldown/is_ready` |
| `core/cooldown/pause` | `api/cooldown/pause` |
| `core/cooldown/remaining` | `api/cooldown/remaining` |
| `core/cooldown/reset_all` | `api/cooldown/reset_all` |
| `core/cooldown/resume` | `api/cooldown/resume` |
| `core/cooldown/set` | `api/cooldown/set` |
| `core/cooldown/try_use` | `api/cooldown/try_use` |
| `core/lib/batch/add` | `systems/lib/batch/add` |
| `core/lib/batch/begin` | `systems/lib/batch/begin` |
| `core/lib/batch/cancel` | `systems/lib/batch/cancel` |
| `core/lib/batch/flush` | `systems/lib/batch/flush` |
| `core/lib/debounce/cmd` | `systems/lib/debounce/cmd` |
| `core/lib/debounce/run` | `systems/lib/debounce/run` |
| `core/lib/fiber/is_alive` | `systems/lib/fiber/is_alive` |
| `core/lib/fiber/kill` | `systems/lib/fiber/kill` |
| `core/lib/fiber/resume` | `systems/lib/fiber/resume` |
| `core/lib/fiber/spawn` | `systems/lib/fiber/spawn` |
| `core/lib/fiber/yield` | `systems/lib/fiber/yield` |
| `core/lib/for_each/entity` | `systems/lib/for_each/entity` |
| `core/lib/for_each/list` | `systems/lib/for_each/list` |
| `core/lib/for_each/player` | `systems/lib/for_each/player` |
| `core/lib/for_each/player_at` | `systems/lib/for_each/player_at` |
| `core/lib/once/cmd` | `core/internal/core/lib/once/cmd` |
| `core/lib/once/per_player` | `systems/lib/once/per_player` |
| `core/lib/once/per_player_reset` | `systems/lib/once/per_player_reset` |
| `core/lib/once/run` | `systems/lib/once/run` |
| `core/lib/queue/add` | `core/internal/core/lib/queue/add` |
| `core/lib/queue/add_as` | `systems/lib/queue/add_as` |
| `core/lib/queue/add_cmd` | `core/internal/core/lib/queue/add_cmd` |
| `core/lib/queue/clear` | `systems/lib/queue/clear` |
| `core/lib/queue/process` | `systems/lib/queue/process` |
| `core/lib/repeat/run` | `systems/lib/repeat/run` |
| `core/lib/repeat/run_as` | `systems/lib/repeat/run_as` |
| `core/lib/repeat/times` | `systems/lib/repeat/times` |
| `core/lib/schedule/cancel` | `systems/lib/schedule/cancel` |
| `core/lib/schedule/cmd` | `core/internal/core/lib/schedule/cmd` |
| `core/lib/schedule/cmd_as` | `systems/lib/schedule/cmd_as` |
| `core/lib/schedule/cmd_if` | `systems/lib/schedule/cmd_if` |
| `core/lib/schedule/list` | `systems/lib/schedule/list` |
| `core/lib/schedule/renew` | `systems/lib/schedule/renew` |
| `core/lib/schedule/reset` | `systems/lib/schedule/reset` |
| `core/lib/schedule/run_as` | `systems/lib/schedule/run_as` |
| `core/lib/schedule/run_if` | `systems/lib/schedule/run_if` |
| `core/lib/string/concat` | `systems/lib/string/concat` |
| `core/lib/string/find` | `systems/lib/string/find` |
| `core/lib/string/insert` | `systems/lib/string/insert` |
| `core/lib/string/replace` | `systems/lib/string/replace` |
| `core/lib/string/split` | `systems/lib/string/split` |
| `core/lib/string/to_lowercase` | `systems/lib/string/to_lowercase` |
| `core/lib/string/to_lowercase_full` | `systems/lib/string/to_lowercase_full` |
| `core/lib/string/to_number` | `core/internal/core/lib/string/to_number` |
| `core/lib/string/to_string` | `systems/lib/string/to_string` |
| `core/lib/string/to_uppercase` | `systems/lib/string/to_uppercase` |
| `core/lib/string/to_uppercase_full` | `systems/lib/string/to_uppercase_full` |
| `core/lib/throttle` | `systems/lib/throttle` |
| `core/lib/ticks_to_time` | `systems/lib/ticks_to_time` |
| `core/lib/wait/cmd` | `systems/lib/wait/cmd` |
| `core/lib/wait/cmd_as` | `systems/lib/wait/cmd_as` |
| `core/lib/wait/run` | `systems/lib/wait/run` |
| `core/lib/wait/run_as` | `systems/lib/wait/run_as` |
| `core/queue/clear` | `api/queue/clear` |
| `core/queue/flush` | `api/queue/flush` |
| `core/queue/push` | `api/queue/push` |
| `core/queue/push_as` | `api/queue/push_as` |
| `core/queue/set_rate` | `api/queue/set_rate` |
| `core/queue/size` | `api/queue/size` |
| `core/state/clear` | `api/state/clear` |
| `core/state/clear_all` | `api/state/clear_all` |
| `core/state/get` | `api/state/get` |
| `core/state/get_score` | `api/state/get_score` |
| `core/state/is` | `api/state/is` |
| `core/state/list` | `api/state/list` |
| `core/state/reset_score` | `api/state/reset_score` |
| `core/state/set` | `api/state/set` |
| `core/state/set_if` | `api/state/set_if` |
| `core/state/set_score` | `api/state/set_score` |
| `core/state/toggle` | `api/state/toggle` |
| `input/anvil` | `api/input/anvil` |
| `input/command_block_minecart` | `api/input/command_block_minecart` |
| `input/give/anvil` | `api/input/give/anvil` |
| `input/give/anvil_custom` | `api/input/give/anvil_custom` |
| `input/give/name_tag` | `api/input/give/name_tag` |
| `input/give/writable_book` | `api/input/give/writable_book` |
| `input/lectern` | `api/input/lectern` |
| `input/name_tag` | `api/input/name_tag` |
| `input/private/anvil_capture` | `api/input/private/anvil_capture` |
| `input/private/anvil_done` | `api/input/private/anvil_done` |
| `input/private/anvil_end` | `api/input/private/anvil_end` |
| `input/private/anvil_open` | `api/input/private/anvil_open` |
| `input/private/anvil_tick` | `api/input/private/anvil_tick` |
| `input/private/book_capture` | `api/input/private/book_capture` |
| `input/private/cbm_align_tp` | `api/input/private/cbm_align_tp` |
| `input/private/cbm_capture` | `api/input/private/cbm_capture` |
| `input/private/cbm_process` | `api/input/private/cbm_process` |
| `input/private/lectern_capture` | `api/input/private/lectern_capture` |
| `input/private/lectern_ray_loop` | `api/input/private/lectern_ray_loop` |
| `input/private/lectern_ray_start` | `api/input/private/lectern_ray_start` |
| `input/private/name_tag_capture` | `api/input/private/name_tag_capture` |
| `input/private/sign_capture` | `api/input/private/sign_capture` |
| `input/private/sign_capture_from_components` | `api/input/private/sign_capture_from_components` |
| `input/private/sign_ray_loop` | `api/input/private/sign_ray_loop` |
| `input/private/sign_ray_start` | `api/input/private/sign_ray_start` |
| `input/sign` | `api/input/sign` |
| `input/summon/command_block_minecart` | `api/input/summon/command_block_minecart` |
| `input/validate/_rule_lower_cand` | `api/input/validate/_rule_lower_cand` |
| `input/validate/_rule_lower_s` | `api/input/validate/_rule_lower_s` |
| `input/validate/_rule_scan` | `api/input/validate/_rule_scan` |
| `input/validate/check` | `api/input/validate/check` |
| `input/validate/int_range` | `api/input/validate/int_range` |
| `input/validate/length` | `api/input/validate/length` |
| `input/validate/rule` | `api/input/validate/rule` |
| `input/validate/rule_define` | `api/input/validate/rule_define` |
| `input/writable_book` | `api/input/writable_book` |
| `player/get/air` | `api/player/get/air` |
| `player/get/armor` | `api/player/get/armor` |
| `player/get/dimension` | `api/player/get/dimension` |
| `player/get/food` | `api/player/get/food` |
| `player/get/gamemode` | `api/player/get/gamemode` |
| `player/get/health` | `api/player/get/health` |
| `player/get/name` | `api/player/get/name` |
| `player/get/online_count` | `api/player/get/online_count` |
| `player/get/pos` | `api/player/get/pos` |
| `player/get/xp` | `api/player/get/xp` |
| `player/init` | `api/player/init` |
| `player/inv/chest_minecart_if_item` | `api/player/inv/chest_minecart_if_item` |
| `player/inv/chest_minecart_unless_item` | `api/player/inv/chest_minecart_unless_item` |
| `player/inv/clear_custom` | `api/player/inv/clear_custom` |
| `player/inv/count_item` | `api/player/inv/count_item` |
| `player/inv/cursor_item` | `api/player/inv/cursor_item` |
| `player/inv/offhand_item` | `api/player/inv/offhand_item` |
| `player/inv/player_if_item` | `api/player/inv/player_if_item` |
| `player/inv/player_slot_if_item` | `api/player/inv/player_slot_if_item` |
| `player/inv/player_unless_item` | `api/player/inv/player_unless_item` |
| `player/inv/selected_item` | `api/player/inv/selected_item` |
| `player/inv/transfer_item` | `api/player/inv/transfer_item` |
| `player/is/burning` | `api/player/is/burning` |
| `player/is/flying` | `api/player/is/flying` |
| `player/is/gliding` | `api/player/is/gliding` |
| `player/is/in_water` | `api/player/is/in_water` |
| `player/is/on_ground` | `api/player/is/on_ground` |
| `player/is/online` | `api/player/is/online` |
| `player/is/sneaking` | `api/player/is/sneaking` |
| `player/is/sprinting` | `api/player/is/sprinting` |
| `player/is/swimming` | `api/player/is/swimming` |
| `player/online_check` | `api/player/online_check` |
| `player/reset` | `api/player/reset` |
| `player/run/cmd_as_uuid` | `api/player/run/cmd_as_uuid` |
| `player/run/func_as_uuid` | `api/player/run/func_as_uuid` |
| `player/team/add` | `api/player/team/add` |
| `player/team/count` | `api/player/team/count` |
| `player/team/create` | `api/player/team/create` |
| `player/team/delete` | `api/player/team/delete` |
| `player/team/has` | `api/player/team/has` |
| `player/team/list` | `api/player/team/list` |
| `player/team/remove` | `api/player/team/remove` |
| `player/team/set_color` | `api/player/team/set_color` |
| `player/team/set_friendly_fire` | `api/player/team/set_friendly_fire` |
| `player/var/add` | `api/player/var/add` |
| `player/var/add_clamped` | `api/player/var/add_clamped` |
| `player/var/add_default` | `api/player/var/add_default` |
| `player/var/clamp` | `api/player/var/clamp` |
| `player/var/copy` | `api/player/var/copy` |
| `player/var/decrement` | `api/player/var/decrement` |
| `player/var/delete` | `api/player/var/delete` |
| `player/var/get` | `api/player/var/get` |
| `player/var/has` | `api/player/var/has` |
| `player/var/increment` | `api/player/var/increment` |
| `player/var/list` | `api/player/var/list` |
| `player/var/set` | `api/player/var/set` |
| `player/var/swap` | `api/player/var/swap` |
| `player/var/toggle` | `api/player/var/toggle` |
| `player/var/transfer` | `api/player/var/transfer` |
| `tui/button` | `api/tui/button` |
| `tui/divider` | `api/tui/divider` |
| `tui/header` | `api/tui/header` |
| `tui/line` | `api/tui/line` |

## Minecraft 26.4 port (0.5.0)

The Minecraft target moved 1.21.7–1.21.8 → 26.4-snapshot-10. No Vortex
function ID, storage path or tag changed; the renames below are Mojang-side
grammar that Vortex files (and callers passing names through Vortex) must
follow.

| Old (≤1.21.8) | New (26.4-snapshot-10) | Where it matters |
|---|---|---|
| `"pack_format": 81` | `"min_format": 128, "max_format": 128` | `vortex-dp/pack.mcmeta`, example pack (single `pack_format` field removed in 1.21.9) |
| `gamerule doDaylightCycle` | `gamerule advance_time` | `api/cmd/time_of`; all game rules became snake_case registry IDs in 1.21.11 (e.g. `keepInventory` → `keep_inventory`, `doFireTick` removed) — matters for anything passed to `api/cmd/gamerule` |
| `time query daytime` | `time query day` | `world/time/get`, `world/time/phase` (ticks into the current day) |
| `time query day` (day count) | `time query day repetition` | `world/time/get` |
| entity predicate `"type": ...` | `"minecraft:entity_type": ...` | 26.2 entity-predicate component keys; old key is now rejected |
| entity predicate `"type_specific": {"type": "minecraft:player", ...}` | `"minecraft:type_specific/player": {...}` | `is_creative`, `is_survival` predicates |
| loot condition `"condition": "minecraft:..."` | `"type": "minecraft:..."` | every predicate/loot/advancement JSON (dispatch key rename) |
| loot function `"function": "minecraft:..."` | `"type": "minecraft:..."` | loot tables and item modifiers (advancement reward `"function"` is an ID and did not change) |
| condition `"minecraft:value_check"` with `"range"` | `"minecraft:int_value_check"` with `"test"` | `equals_uuid` predicate (`value_check` was split into int/float variants) |
| advancement criteria `"entity": [ <condition> ]` / `"location": [ <condition> ]` | `"entity": <condition>` / `"location": <condition>` | 26.x trigger codecs take a single condition object, not a list |
