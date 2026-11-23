<!-- AI-assisted: written with Claude (Anthropic); see CREDITS.md. -->
# Vortex public API

This file is the contract between Vortex and the datapacks that use it.
It lists every name that is **stable**: public function IDs, public storage
paths, public function tags, and the naming rules everything else follows.
Anything not listed here is internal and may move, rename or disappear in
any release (see RENAMES.md for the moves that already happened).

The pack root is `vortex-dp/` (its `pack.mcmeta` and `data/` are what gets
zipped for release). The namespace is `vortex:` for everything in this file.

## Stability policy

- A **stable** name keeps working, with the documented inputs and outputs,
  across patch and minor releases. Breaking a stable name requires a major
  version bump and an entry in RENAMES.md with the old → new mapping.
- **Internal** names: everything under `core/internal/`, every folder named
  `private/` (e.g. `api/input/private/`), every storage path not listed
  under "Storage contracts" below, and every function tag not listed under
  "Hook tags". Internal functions exist to be called by Vortex itself.
- Function IDs below are generated from the source tree; regenerate the
  index after moving a public function with:
  `find vortex-dp/data/vortex/function/{api,events,world,systems} -name '*.mcfunction'`

## Naming discipline

All names Vortex creates are prefixed so two frameworks can coexist in one
world without sharing scoreboard objectives or tags by accident:

| Kind | Prefix | Example |
|---|---|---|
| Scoreboard objectives | `vortex.` | `vortex.tick`, `vortex.player_action.uuid.0` |
| Entity (scoreboard) tags | `vortex.` | `vortex.player_action.sneaking` |
| Command storage | `vortex:` | `vortex:engine`, `vortex:input` |
| Functions / function tags | `vortex:` / `#vortex:` | `vortex:api/callback/run`, `#vortex:events/on_join` |
| Fake-player holders | `#vortex.` / `#vortaforge.` | `#vortex.player_action.major` |

`node scripts/check-namespace.mjs vortex-dp` enforces this in CI
(macro-expanded names chosen by the caller, e.g. `api/perm/trigger/bind`,
are the caller's responsibility and are skipped by the check).

## Storage contracts

Only these storage paths are public contracts. Everything else under
`vortex:*` (including `vortex:engine`, `vortex:dialog_*` and the scratch
storages `vortex:tmp`, `vortex:item_tmp`, `vortex:player_tmp`) is internal:
Vortex may restructure it at any time.

| Storage | Contract |
|---|---|
| `vortex:callback in` | Input of `vortex:api/callback/run`: `{id:"mypack:event",args:{...}}`. Handlers read `vortex:callback top`. See README, "Callbacks". |
| `vortex:input` | Result/input buffers of the `api/input/*` capture helpers; fields per function header. |
| `vortex:input_validate result` | Output of the `api/input/validate/*` validators (`{valid:1b,...}`). |
| `vortex:output` | Output buffers of `api/*` functions that return structured data (e.g. `multi_cmd` statistics). Per-function headers name the fields. |
| `vortex:store conv` | Output of `vortex:api/store/convert`. |
| `vortex:dbg out` / `vortex:dbg err` | Append-only debug lines (`{src,msg}`, last 50 each); the API is `vortex:systems/dbg/{out,err,show,clear}`. |
| `vortex:config` (mirror) / `vortex:engine config` | Runtime config; read/write through `vortex:core/config/{get,set}`, not by hand. |

Full storage inventory for reference (presence in this list is **not** a
stability promise): `vortex:audit`, `vortex:block`, `vortex:callback`, `vortex:config`, `vortex:container`, `vortex:dbg`, `vortex:diagnostics`, `vortex:dialog_action`, `vortex:dialog_catalog`, `vortex:dialog_conditional`, `vortex:dialog_config`, `vortex:dialog_ctx`, `vortex:dialog_db`, `vortex:dialog_delay`, `vortex:dialog_dispatch`, `vortex:dialog_event`, `vortex:dialog_favorites`, `vortex:dialog_filter`, `vortex:dialog_i18n`, `vortex:dialog_layout`, `vortex:dialog_nav`, `vortex:dialog_notification`, `vortex:dialog_progress`, `vortex:dialog_refresh`, `vortex:dialog_reject`, `vortex:dialog_rules`, `vortex:dialog_sort`, `vortex:dialog_state`, `vortex:dialog_stats`, `vortex:dialog_template`, `vortex:dialog_templates`, `vortex:dialog_theme`, `vortex:dialog_themes`, `vortex:dialog_toggle`, `vortex:dialog_translations`, `vortex:dialog_width`, `vortex:dialog_work`, `vortex:engine`, `vortex:hook`, `vortex:input`, `vortex:input_validate`, `vortex:item_tmp`, `vortex:names`, `vortex:output`, `vortex:perm_require`, `vortex:player_tmp`, `vortex:rate_limit`, `vortex:store`, `vortex:text`, `vortex:text_map`, `vortex:title`, `vortex:tmp`, `vortex:tui`, `vortex:uuid`, `vortex:validate`

## Hook tags (public extension points)

User packs add their own functions to these tags from their own datapack
(e.g. `data/vortex/tags/function/events/on_join.json` in the user pack);
Vortex fires them and never needs to know the user's function names.

### Function tags (25)

| ID |
|---|
| `#vortex:events/on_death` |
| `#vortex:events/on_enchant` |
| `#vortex:events/on_join` |
| `#vortex:events/on_jump` |
| `#vortex:events/on_lc` |
| `#vortex:events/on_load` |
| `#vortex:events/on_open_gui` |
| `#vortex:events/on_rc` |
| `#vortex:events/on_respawn` |
| `#vortex:hook/config_apply` |
| `#vortex:hook/config_ensure` |
| `#vortex:hook/config_init` |
| `#vortex:hook/dialog_after_action` |
| `#vortex:hook/dialog_before_action` |
| `#vortex:hook/dialog_on_close` |
| `#vortex:hook/dialog_on_event` |
| `#vortex:hook/dialog_on_reject` |
| `#vortex:hook/dialog_on_show` |
| `#vortex:hook/dialog_on_timeout` |
| `#vortex:hook/queue_process` |
| `#vortex:callback/dispatch` |
| `#vortex:callback/macro_cmd` |
| `#vortex:callback/macro_function` |
| `#vortex:init` |
| `#vortex:loop` |

Semantics:

- `#vortex:events/on_load` fires once per load/reload at the end of
  `vortex:setup`, after every module finished loading. Use it to
  (re)register transient things. (It is *not* chained from `#vortex:init`:
  the init tag runs only on the full-init path, reloads skip it.)
- `#vortex:init` runs inside the load pipeline on full (re)init only
  (e.g. region watches re-register here).
- `#vortex:events/on_join`, `on_death`, `on_respawn`, `on_jump`, `on_lc`,
  `on_rc`, `on_enchant`, `on_open_gui` fire from the player-event bridges
  with the player as `@s` where the bridge has one; see each bridge under
  `core/internal/systems/hook/`.
- `#vortex:callback/dispatch` sees every callback; `#vortex:callback/macro_cmd`
  and `#vortex:callback/macro_function` see the blocked-macro reports.

## Public functions

### vortex:api/* — public entry points (513)

| ID |
|---|
| `vortex:api/block/hopper_in` |
| `vortex:api/block/hopper_out` |
| `vortex:api/block/insert` |
| `vortex:api/block/list` |
| `vortex:api/block/register` |
| `vortex:api/block/take` |
| `vortex:api/block/unregister` |
| `vortex:api/block/validate` |
| `vortex:api/callback/run` |
| `vortex:api/callback/run_id` |
| `vortex:api/cb/cancel` |
| `vortex:api/cb/cancel_id` |
| `vortex:api/cb/list` |
| `vortex:api/cb/queue_size` |
| `vortex:api/cb/run` |
| `vortex:api/cb/run_delayed` |
| `vortex:api/cb/run_repeating` |
| `vortex:api/cb/run_sequence` |
| `vortex:api/cb/time_left` |
| `vortex:api/cmd/actionbar` |
| `vortex:api/cmd/advancement_check` |
| `vortex:api/cmd/advancement_grant` |
| `vortex:api/cmd/advancement_revoke` |
| `vortex:api/cmd/as_player` |
| `vortex:api/cmd/attribute_add_modifier` |
| `vortex:api/cmd/attribute_get` |
| `vortex:api/cmd/attribute_get_modifier` |
| `vortex:api/cmd/attribute_remove_modifier` |
| `vortex:api/cmd/attribute_reset` |
| `vortex:api/cmd/attribute_set` |
| `vortex:api/cmd/bossbar_add` |
| `vortex:api/cmd/bossbar_remove` |
| `vortex:api/cmd/bossbar_set_max` |
| `vortex:api/cmd/bossbar_set_players` |
| `vortex:api/cmd/bossbar_set_value` |
| `vortex:api/cmd/clear` |
| `vortex:api/cmd/clear_item` |
| `vortex:api/cmd/clone` |
| `vortex:api/cmd/clone_masked` |
| `vortex:api/cmd/compute_block` |
| `vortex:api/cmd/compute_default` |
| `vortex:api/cmd/compute_entity` |
| `vortex:api/cmd/console_me` |
| `vortex:api/cmd/console_say` |
| `vortex:api/cmd/damage` |
| `vortex:api/cmd/damage_typed` |
| `vortex:api/cmd/data_remove_block` |
| `vortex:api/cmd/data_remove_entity` |
| `vortex:api/cmd/data_remove_storage` |
| `vortex:api/cmd/difficulty` |
| `vortex:api/cmd/display_name` |
| `vortex:api/cmd/effect_clear` |
| `vortex:api/cmd/effect_clear_one` |
| `vortex:api/cmd/effect_give` |
| `vortex:api/cmd/effect_give_all` |
| `vortex:api/cmd/empty` |
| `vortex:api/cmd/enchant` |
| `vortex:api/cmd/execute_if_pred` |
| `vortex:api/cmd/fill` |
| `vortex:api/cmd/forceload_add` |
| `vortex:api/cmd/forceload_remove` |
| `vortex:api/cmd/freeze` |
| `vortex:api/cmd/function` |
| `vortex:api/cmd/gamemode` |
| `vortex:api/cmd/gamerule` |
| `vortex:api/cmd/give` |
| `vortex:api/cmd/give_one` |
| `vortex:api/cmd/heal` |
| `vortex:api/cmd/item_modify` |
| `vortex:api/cmd/item_rename` |
| `vortex:api/cmd/kill` |
| `vortex:api/cmd/line_break` |
| `vortex:api/cmd/locate_structure` |
| `vortex:api/cmd/loot_drop` |
| `vortex:api/cmd/loot_give` |
| `vortex:api/cmd/msg` |
| `vortex:api/cmd/msg_raw` |
| `vortex:api/cmd/other/action_run` |
| `vortex:api/cmd/other/multi_cmd/advanced/run_with_options` |
| `vortex:api/cmd/other/multi_cmd/from_input` |
| `vortex:api/cmd/other/multi_cmd/from_input_as` |
| `vortex:api/cmd/other/multi_cmd/run` |
| `vortex:api/cmd/other/multi_cmd/run_as` |
| `vortex:api/cmd/other/multi_cmd/run_at` |
| `vortex:api/cmd/other/multi_cmd/run_func` |
| `vortex:api/cmd/other/multi_cmd/utils/add_command` |
| `vortex:api/cmd/other/multi_cmd/utils/clear_queue` |
| `vortex:api/cmd/other/multi_cmd/utils/get_stats` |
| `vortex:api/cmd/other/multi_cmd/utils/run_with_options_tracked` |
| `vortex:api/cmd/other/multi_cmd` |
| `vortex:api/cmd/other/multi_cmd_adv` |
| `vortex:api/cmd/other/run_as_uuid` |
| `vortex:api/cmd/other/run_nearest` |
| `vortex:api/cmd/other/run_random` |
| `vortex:api/cmd/other/run_self` |
| `vortex:api/cmd/other/storage_reset` |
| `vortex:api/cmd/other/storage_set` |
| `vortex:api/cmd/particle` |
| `vortex:api/cmd/place_feature` |
| `vortex:api/cmd/place_structure` |
| `vortex:api/cmd/ride` |
| `vortex:api/cmd/ride_dismount` |
| `vortex:api/cmd/run_cb_reset` |
| `vortex:api/cmd/run_with_cb` |
| `vortex:api/cmd/scoreboard_add` |
| `vortex:api/cmd/scoreboard_get` |
| `vortex:api/cmd/scoreboard_set` |
| `vortex:api/cmd/set_clock_rate` |
| `vortex:api/cmd/setblock` |
| `vortex:api/cmd/sound` |
| `vortex:api/cmd/sound_all` |
| `vortex:api/cmd/spectate` |
| `vortex:api/cmd/spectate_stop` |
| `vortex:api/cmd/spreadplayers` |
| `vortex:api/cmd/stopsound` |
| `vortex:api/cmd/storage_set` |
| `vortex:api/cmd/subtitle` |
| `vortex:api/cmd/summon` |
| `vortex:api/cmd/swing` |
| `vortex:api/cmd/tag_add` |
| `vortex:api/cmd/tag_remove` |
| `vortex:api/cmd/tellraw` |
| `vortex:api/cmd/time_add` |
| `vortex:api/cmd/time_of` |
| `vortex:api/cmd/time_set` |
| `vortex:api/cmd/title` |
| `vortex:api/cmd/title_all` |
| `vortex:api/cmd/title_bold` |
| `vortex:api/cmd/title_clear` |
| `vortex:api/cmd/title_reset` |
| `vortex:api/cmd/title_sub` |
| `vortex:api/cmd/title_times` |
| `vortex:api/cmd/tp` |
| `vortex:api/cmd/tp_facing` |
| `vortex:api/cmd/tp_to_coords` |
| `vortex:api/cmd/tp_to_entity` |
| `vortex:api/cmd/tp_to_player` |
| `vortex:api/cmd/trigger_set` |
| `vortex:api/cmd/unfreeze` |
| `vortex:api/cmd/weather` |
| `vortex:api/cmd/xp_add` |
| `vortex:api/cmd/xp_get` |
| `vortex:api/cmd/xp_set` |
| `vortex:api/color/from_score` |
| `vortex:api/color/gradient_delete` |
| `vortex:api/color/gradient_set` |
| `vortex:api/color/lerp` |
| `vortex:api/color/palette_delete` |
| `vortex:api/color/palette_get` |
| `vortex:api/color/palette_list` |
| `vortex:api/color/palette_set` |
| `vortex:api/color/resolve` |
| `vortex:api/color/validate` |
| `vortex:api/container/info` |
| `vortex:api/container/is_empty` |
| `vortex:api/container/is_full` |
| `vortex:api/container/slot_clear` |
| `vortex:api/container/slot_get` |
| `vortex:api/container/slot_is_empty` |
| `vortex:api/container/slot_set` |
| `vortex:api/container/slot_swap` |
| `vortex:api/container/transfer` |
| `vortex:api/cooldown/clear` |
| `vortex:api/cooldown/clear_all` |
| `vortex:api/cooldown/detail` |
| `vortex:api/cooldown/extend` |
| `vortex:api/cooldown/is_ready` |
| `vortex:api/cooldown/pause` |
| `vortex:api/cooldown/remaining` |
| `vortex:api/cooldown/reset_all` |
| `vortex:api/cooldown/resume` |
| `vortex:api/cooldown/set` |
| `vortex:api/cooldown/try_use` |
| `vortex:api/diagnostics/report` |
| `vortex:api/diagnostics/status` |
| `vortex:api/dialog/action/native` |
| `vortex:api/dialog/action/run_command` |
| `vortex:api/dialog/action_conditional` |
| `vortex:api/dialog/action_delay` |
| `vortex:api/dialog/action_delay_cancel` |
| `vortex:api/dialog/actions` |
| `vortex:api/dialog/after_action` |
| `vortex:api/dialog/auto_refresh` |
| `vortex:api/dialog/auto_refresh_stop` |
| `vortex:api/dialog/back` |
| `vortex:api/dialog/begin` |
| `vortex:api/dialog/body` |
| `vortex:api/dialog/body_clear` |
| `vortex:api/dialog/button` |
| `vortex:api/dialog/button_enabled` |
| `vortex:api/dialog/button_label` |
| `vortex:api/dialog/button_tooltip` |
| `vortex:api/dialog/button_width` |
| `vortex:api/dialog/catalog` |
| `vortex:api/dialog/catalog_favorites` |
| `vortex:api/dialog/catalog_filter` |
| `vortex:api/dialog/catalog_page` |
| `vortex:api/dialog/catalog_reopen` |
| `vortex:api/dialog/catalog_sorted` |
| `vortex:api/dialog/close` |
| `vortex:api/dialog/columns` |
| `vortex:api/dialog/confirmation` |
| `vortex:api/dialog/cooldown` |
| `vortex:api/dialog/exit` |
| `vortex:api/dialog/exit_width` |
| `vortex:api/dialog/favorite_get` |
| `vortex:api/dialog/favorite_remove` |
| `vortex:api/dialog/favorite_set` |
| `vortex:api/dialog/favorites_clear` |
| `vortex:api/dialog/forget` |
| `vortex:api/dialog/form_code` |
| `vortex:api/dialog/form_digit` |
| `vortex:api/dialog/form_guard` |
| `vortex:api/dialog/form_rules` |
| `vortex:api/dialog/guarded_button` |
| `vortex:api/dialog/input` |
| `vortex:api/dialog/item` |
| `vortex:api/dialog/locale_set` |
| `vortex:api/dialog/localized_body` |
| `vortex:api/dialog/localized_button` |
| `vortex:api/dialog/localized_title` |
| `vortex:api/dialog/native_action/close` |
| `vortex:api/dialog/native_action/copy_to_clipboard` |
| `vortex:api/dialog/native_action/function` |
| `vortex:api/dialog/native_action/open_url` |
| `vortex:api/dialog/native_action/refresh` |
| `vortex:api/dialog/native_action/run_command` |
| `vortex:api/dialog/native_action/show_dialog` |
| `vortex:api/dialog/native_action/suggest_command` |
| `vortex:api/dialog/notice` |
| `vortex:api/dialog/notification_next` |
| `vortex:api/dialog/notifications_clear` |
| `vortex:api/dialog/notifications_show` |
| `vortex:api/dialog/notify` |
| `vortex:api/dialog/options` |
| `vortex:api/dialog/progress` |
| `vortex:api/dialog/progress_style` |
| `vortex:api/dialog/push` |
| `vortex:api/dialog/raw_button` |
| `vortex:api/dialog/raw_show` |
| `vortex:api/dialog/refresh` |
| `vortex:api/dialog/show` |
| `vortex:api/dialog/state_clear` |
| `vortex:api/dialog/state_get` |
| `vortex:api/dialog/state_remove` |
| `vortex:api/dialog/state_set` |
| `vortex:api/dialog/stats` |
| `vortex:api/dialog/stats_reset` |
| `vortex:api/dialog/template_delete` |
| `vortex:api/dialog/template_load` |
| `vortex:api/dialog/template_save` |
| `vortex:api/dialog/theme_apply` |
| `vortex:api/dialog/theme_register` |
| `vortex:api/dialog/themed_body` |
| `vortex:api/dialog/title` |
| `vortex:api/dialog/translate` |
| `vortex:api/dialog/translation_register` |
| `vortex:api/dialog/view` |
| `vortex:api/gamerule/get` |
| `vortex:api/gamerule/reset` |
| `vortex:api/gamerule/set` |
| `vortex:api/input/anvil` |
| `vortex:api/input/command_block_minecart` |
| `vortex:api/input/give/anvil` |
| `vortex:api/input/give/anvil_custom` |
| `vortex:api/input/give/name_tag` |
| `vortex:api/input/give/writable_book` |
| `vortex:api/input/lectern` |
| `vortex:api/input/name_tag` |
| `vortex:api/input/private/anvil_capture` |
| `vortex:api/input/private/anvil_done` |
| `vortex:api/input/private/anvil_end` |
| `vortex:api/input/private/anvil_open` |
| `vortex:api/input/private/anvil_tick` |
| `vortex:api/input/private/book_capture` |
| `vortex:api/input/private/cbm_align_tp` |
| `vortex:api/input/private/cbm_capture` |
| `vortex:api/input/private/cbm_process` |
| `vortex:api/input/private/lectern_capture` |
| `vortex:api/input/private/lectern_ray_loop` |
| `vortex:api/input/private/lectern_ray_start` |
| `vortex:api/input/private/name_tag_capture` |
| `vortex:api/input/private/sign_capture` |
| `vortex:api/input/private/sign_capture_from_components` |
| `vortex:api/input/private/sign_ray_loop` |
| `vortex:api/input/private/sign_ray_start` |
| `vortex:api/input/sign` |
| `vortex:api/input/summon/command_block_minecart` |
| `vortex:api/input/validate/_rule_lower_cand` |
| `vortex:api/input/validate/_rule_lower_s` |
| `vortex:api/input/validate/_rule_scan` |
| `vortex:api/input/validate/check` |
| `vortex:api/input/validate/int_range` |
| `vortex:api/input/validate/length` |
| `vortex:api/input/validate/rule` |
| `vortex:api/input/validate/rule_define` |
| `vortex:api/input/writable_book` |
| `vortex:api/interaction/bind_attack` |
| `vortex:api/interaction/bind_use` |
| `vortex:api/interaction/list` |
| `vortex:api/interaction/remove` |
| `vortex:api/interaction/spawn` |
| `vortex:api/interaction/unbind_attack` |
| `vortex:api/interaction/unbind_use` |
| `vortex:api/item/combo_marker` |
| `vortex:api/item/durability_overlay` |
| `vortex:api/item/hidden_flag` |
| `vortex:api/item/owner_tag` |
| `vortex:api/item/use_cooldown` |
| `vortex:api/item/use_cooldown_check` |
| `vortex:api/macro/with_advancement` |
| `vortex:api/macro/with_function` |
| `vortex:api/macro/with_predicate` |
| `vortex:api/macro/with_score` |
| `vortex:api/macro/with_tag` |
| `vortex:api/notice/show` |
| `vortex:api/perm/check` |
| `vortex:api/perm/clear` |
| `vortex:api/perm/count` |
| `vortex:api/perm/exec` |
| `vortex:api/perm/grant` |
| `vortex:api/perm/group/assign` |
| `vortex:api/perm/group/create` |
| `vortex:api/perm/group/grant_perm` |
| `vortex:api/perm/group/list` |
| `vortex:api/perm/group/remove` |
| `vortex:api/perm/has` |
| `vortex:api/perm/list` |
| `vortex:api/perm/require` |
| `vortex:api/perm/revoke` |
| `vortex:api/perm/run` |
| `vortex:api/perm/trigger/bind` |
| `vortex:api/perm/trigger/bind_cmd` |
| `vortex:api/perm/trigger/clear` |
| `vortex:api/perm/trigger/enable` |
| `vortex:api/perm/trigger/unbind` |
| `vortex:api/player/get/air` |
| `vortex:api/player/get/armor` |
| `vortex:api/player/get/dimension` |
| `vortex:api/player/get/food` |
| `vortex:api/player/get/gamemode` |
| `vortex:api/player/get/health` |
| `vortex:api/player/get/name` |
| `vortex:api/player/get/online_count` |
| `vortex:api/player/get/pos` |
| `vortex:api/player/get/xp` |
| `vortex:api/player/init` |
| `vortex:api/player/inv/chest_minecart_if_item` |
| `vortex:api/player/inv/chest_minecart_unless_item` |
| `vortex:api/player/inv/clear_custom` |
| `vortex:api/player/inv/count_item` |
| `vortex:api/player/inv/cursor_item` |
| `vortex:api/player/inv/offhand_item` |
| `vortex:api/player/inv/player_if_item` |
| `vortex:api/player/inv/player_slot_if_item` |
| `vortex:api/player/inv/player_unless_item` |
| `vortex:api/player/inv/selected_item` |
| `vortex:api/player/inv/transfer_item` |
| `vortex:api/player/is/burning` |
| `vortex:api/player/is/flying` |
| `vortex:api/player/is/gliding` |
| `vortex:api/player/is/in_water` |
| `vortex:api/player/is/on_ground` |
| `vortex:api/player/is/online` |
| `vortex:api/player/is/sneaking` |
| `vortex:api/player/is/sprinting` |
| `vortex:api/player/is/swimming` |
| `vortex:api/player/online_check` |
| `vortex:api/player/reset` |
| `vortex:api/player/run/cmd_as_uuid` |
| `vortex:api/player/run/func_as_uuid` |
| `vortex:api/player/team/add` |
| `vortex:api/player/team/count` |
| `vortex:api/player/team/create` |
| `vortex:api/player/team/delete` |
| `vortex:api/player/team/has` |
| `vortex:api/player/team/list` |
| `vortex:api/player/team/remove` |
| `vortex:api/player/team/set_color` |
| `vortex:api/player/team/set_friendly_fire` |
| `vortex:api/player/var/add` |
| `vortex:api/player/var/add_clamped` |
| `vortex:api/player/var/add_default` |
| `vortex:api/player/var/clamp` |
| `vortex:api/player/var/copy` |
| `vortex:api/player/var/decrement` |
| `vortex:api/player/var/delete` |
| `vortex:api/player/var/get` |
| `vortex:api/player/var/has` |
| `vortex:api/player/var/increment` |
| `vortex:api/player/var/list` |
| `vortex:api/player/var/set` |
| `vortex:api/player/var/swap` |
| `vortex:api/player/var/toggle` |
| `vortex:api/player/var/transfer` |
| `vortex:api/queue/clear` |
| `vortex:api/queue/flush` |
| `vortex:api/queue/push` |
| `vortex:api/queue/push_as` |
| `vortex:api/queue/set_rate` |
| `vortex:api/queue/size` |
| `vortex:api/state/clear` |
| `vortex:api/state/clear_all` |
| `vortex:api/state/get` |
| `vortex:api/state/get_score` |
| `vortex:api/state/is` |
| `vortex:api/state/list` |
| `vortex:api/state/reset_score` |
| `vortex:api/state/set` |
| `vortex:api/state/set_if` |
| `vortex:api/state/set_score` |
| `vortex:api/state/toggle` |
| `vortex:api/store/add` |
| `vortex:api/store/convert` |
| `vortex:api/store/default` |
| `vortex:api/store/get` |
| `vortex:api/store/has` |
| `vortex:api/store/nbt/add` |
| `vortex:api/store/nbt/append` |
| `vortex:api/store/nbt/copy` |
| `vortex:api/store/nbt/count` |
| `vortex:api/store/nbt/exists` |
| `vortex:api/store/nbt/get` |
| `vortex:api/store/nbt/merge` |
| `vortex:api/store/nbt/move` |
| `vortex:api/store/nbt/pop` |
| `vortex:api/store/nbt/remove` |
| `vortex:api/store/nbt/set` |
| `vortex:api/store/nbt/set_default` |
| `vortex:api/store/nbt/shift` |
| `vortex:api/store/nbt/toggle` |
| `vortex:api/store/player/add` |
| `vortex:api/store/player/default` |
| `vortex:api/store/player/get` |
| `vortex:api/store/player/has` |
| `vortex:api/store/player/remove` |
| `vortex:api/store/player/set` |
| `vortex:api/store/player/show` |
| `vortex:api/store/remove` |
| `vortex:api/store/render` |
| `vortex:api/store/render_all` |
| `vortex:api/store/set` |
| `vortex:api/store/show` |
| `vortex:api/store/text/define` |
| `vortex:api/store/text/remove` |
| `vortex:api/title/actionbar` |
| `vortex:api/title/actionbar_all_p` |
| `vortex:api/title/actionbar_p` |
| `vortex:api/title/actionbar_tag_p` |
| `vortex:api/title/broadcast` |
| `vortex:api/title/broadcast_p` |
| `vortex:api/title/clear` |
| `vortex:api/title/reset` |
| `vortex:api/title/show` |
| `vortex:api/title/show_area_p` |
| `vortex:api/title/show_p` |
| `vortex:api/title/show_raw` |
| `vortex:api/title/show_tag_p` |
| `vortex:api/title/show_team_p` |
| `vortex:api/title/show_to_p` |
| `vortex:api/title/times` |
| `vortex:api/toggle/block/false` |
| `vortex:api/toggle/block/true` |
| `vortex:api/toggle/cb/false` |
| `vortex:api/toggle/cb/true` |
| `vortex:api/toggle/container/false` |
| `vortex:api/toggle/container/true` |
| `vortex:api/toggle/geo/false` |
| `vortex:api/toggle/geo/true` |
| `vortex:api/toggle/hook/false` |
| `vortex:api/toggle/hook/true` |
| `vortex:api/toggle/interaction/false` |
| `vortex:api/toggle/interaction/true` |
| `vortex:api/toggle/list` |
| `vortex:api/toggle/macro_cmd/false` |
| `vortex:api/toggle/macro_cmd/true` |
| `vortex:api/toggle/macro_function/false` |
| `vortex:api/toggle/macro_function/true` |
| `vortex:api/toggle/perm/cmd_off` |
| `vortex:api/toggle/perm/cmd_on` |
| `vortex:api/toggle/perm/default_off` |
| `vortex:api/toggle/perm/default_on` |
| `vortex:api/toggle/perm/enforce_off` |
| `vortex:api/toggle/perm/enforce_on` |
| `vortex:api/toggle/perm/false` |
| `vortex:api/toggle/perm/status` |
| `vortex:api/toggle/perm/true` |
| `vortex:api/toggle/show` |
| `vortex:api/toggle/wand/false` |
| `vortex:api/toggle/wand/true` |
| `vortex:api/trigger/bind` |
| `vortex:api/trigger/bind_cmd` |
| `vortex:api/trigger/disable` |
| `vortex:api/trigger/enable` |
| `vortex:api/trigger/list` |
| `vortex:api/trigger/unbind` |
| `vortex:api/trigger/unbind_all` |
| `vortex:api/tui/button` |
| `vortex:api/tui/divider` |
| `vortex:api/tui/header` |
| `vortex:api/tui/line` |
| `vortex:api/wand/cooldown_check` |
| `vortex:api/wand/cooldown_set` |
| `vortex:api/wand/give` |
| `vortex:api/wand/give_custom` |
| `vortex:api/wand/give_lore` |
| `vortex:api/wand/has` |
| `vortex:api/wand/list` |
| `vortex:api/wand/register` |
| `vortex:api/wand/register_cmd` |
| `vortex:api/wand/register_fn` |
| `vortex:api/wand/unregister` |
| `vortex:api/wand/unregister_all` |
### vortex:events/* — event bus (13)

| ID |
|---|
| `vortex:events/clear_context` |
| `vortex:events/count` |
| `vortex:events/fire` |
| `vortex:events/fire_as` |
| `vortex:events/fire_queued` |
| `vortex:events/fire_to_player` |
| `vortex:events/has` |
| `vortex:events/has_func` |
| `vortex:events/list` |
| `vortex:events/register` |
| `vortex:events/register_once` |
| `vortex:events/unregister` |
| `vortex:events/unregister_one` |
### vortex:world/* — world helpers (29)

| ID |
|---|
| `vortex:world/block/run_if` |
| `vortex:world/block/run_unless` |
| `vortex:world/block/set_if` |
| `vortex:world/entity/clear_effects` |
| `vortex:world/entity/count` |
| `vortex:world/entity/count_near` |
| `vortex:world/entity/damage` |
| `vortex:world/entity/for_each` |
| `vortex:world/entity/for_each_in_radius` |
| `vortex:world/entity/give_effect` |
| `vortex:world/entity/kill_tagged` |
| `vortex:world/entity/nearest` |
| `vortex:world/entity/random` |
| `vortex:world/entity/set_health` |
| `vortex:world/entity/set_name` |
| `vortex:world/entity/summon_at_player` |
| `vortex:world/entity/tag_add` |
| `vortex:world/entity/tag_remove` |
| `vortex:world/entity/tp_to` |
| `vortex:world/region/clone` |
| `vortex:world/region/fill_hollow` |
| `vortex:world/region/fill_keep` |
| `vortex:world/region/fill_outline` |
| `vortex:world/region/fill_replace` |
| `vortex:world/time/get` |
| `vortex:world/time/phase` |
| `vortex:world/time/set_phase` |
| `vortex:world/weather/set` |
| `vortex:world/weather` |
### vortex:systems/* — reusable building blocks (235)

| ID |
|---|
| `vortex:systems/audit/clear` |
| `vortex:systems/audit/count` |
| `vortex:systems/audit/record` |
| `vortex:systems/audit/show` |
| `vortex:systems/color/init` |
| `vortex:systems/dbg/clear` |
| `vortex:systems/dbg/err` |
| `vortex:systems/dbg/out` |
| `vortex:systems/dbg/show` |
| `vortex:systems/dbg/trim_err` |
| `vortex:systems/dbg/trim_out` |
| `vortex:systems/diagnostics/checks/config` |
| `vortex:systems/diagnostics/checks/module_one` |
| `vortex:systems/diagnostics/checks/modules` |
| `vortex:systems/diagnostics/checks/modules_step` |
| `vortex:systems/diagnostics/checks/queue` |
| `vortex:systems/diagnostics/checks/runtime` |
| `vortex:systems/diagnostics/collect` |
| `vortex:systems/flag/any` |
| `vortex:systems/flag/clear` |
| `vortex:systems/flag/copy` |
| `vortex:systems/flag/get` |
| `vortex:systems/flag/get_or_default` |
| `vortex:systems/flag/list` |
| `vortex:systems/flag/list_systems` |
| `vortex:systems/flag/set` |
| `vortex:systems/flag/set_if` |
| `vortex:systems/flag/toggle` |
| `vortex:systems/flag/toggle_system/flip` |
| `vortex:systems/flag/toggle_system` |
| `vortex:systems/flag/unset` |
| `vortex:systems/geo/as_nearby_player` |
| `vortex:systems/geo/in_region` |
| `vortex:systems/geo/in_region_unless` |
| `vortex:systems/geo/in_sphere` |
| `vortex:systems/geo/near_entity` |
| `vortex:systems/geo/near_entity_unless` |
| `vortex:systems/geo/region_watch/list` |
| `vortex:systems/geo/region_watch/register` |
| `vortex:systems/geo/region_watch/unregister` |
| `vortex:systems/hook/bind` |
| `vortex:systems/hook/list` |
| `vortex:systems/hook/on_advancement_fire` |
| `vortex:systems/hook/on_break_block` |
| `vortex:systems/hook/on_bred_animals` |
| `vortex:systems/hook/on_brewed_potion` |
| `vortex:systems/hook/on_dimension_change` |
| `vortex:systems/hook/on_drop` |
| `vortex:systems/hook/on_eat` |
| `vortex:systems/hook/on_entity_kill` |
| `vortex:systems/hook/on_fish_caught` |
| `vortex:systems/hook/on_hero_of_the_village` |
| `vortex:systems/hook/on_interact_anvil` |
| `vortex:systems/hook/on_interact_shulker_box` |
| `vortex:systems/hook/on_item_use` |
| `vortex:systems/hook/on_jump` |
| `vortex:systems/hook/on_killed_by_arrow` |
| `vortex:systems/hook/on_open_chest` |
| `vortex:systems/hook/on_placed_block` |
| `vortex:systems/hook/on_target_hit` |
| `vortex:systems/hook/on_trade` |
| `vortex:systems/hook/raycast/found` |
| `vortex:systems/hook/raycast/loop` |
| `vortex:systems/hook/raycast/start` |
| `vortex:systems/hook/unbind` |
| `vortex:systems/hook/unbind_all` |
| `vortex:systems/lib/batch/add` |
| `vortex:systems/lib/batch/begin` |
| `vortex:systems/lib/batch/cancel` |
| `vortex:systems/lib/batch/flush` |
| `vortex:systems/lib/debounce/cmd` |
| `vortex:systems/lib/debounce/run` |
| `vortex:systems/lib/fiber/is_alive` |
| `vortex:systems/lib/fiber/kill` |
| `vortex:systems/lib/fiber/resume` |
| `vortex:systems/lib/fiber/spawn` |
| `vortex:systems/lib/fiber/yield` |
| `vortex:systems/lib/for_each/entity` |
| `vortex:systems/lib/for_each/list` |
| `vortex:systems/lib/for_each/player` |
| `vortex:systems/lib/for_each/player_at` |
| `vortex:systems/lib/once/per_player` |
| `vortex:systems/lib/once/per_player_reset` |
| `vortex:systems/lib/once/run` |
| `vortex:systems/lib/queue/add_as` |
| `vortex:systems/lib/queue/clear` |
| `vortex:systems/lib/queue/process` |
| `vortex:systems/lib/repeat/run` |
| `vortex:systems/lib/repeat/run_as` |
| `vortex:systems/lib/repeat/times` |
| `vortex:systems/lib/schedule/cancel` |
| `vortex:systems/lib/schedule/cmd_as` |
| `vortex:systems/lib/schedule/cmd_if` |
| `vortex:systems/lib/schedule/list` |
| `vortex:systems/lib/schedule/renew` |
| `vortex:systems/lib/schedule/reset` |
| `vortex:systems/lib/schedule/run_as` |
| `vortex:systems/lib/schedule/run_if` |
| `vortex:systems/lib/string/concat` |
| `vortex:systems/lib/string/find` |
| `vortex:systems/lib/string/insert` |
| `vortex:systems/lib/string/replace` |
| `vortex:systems/lib/string/split` |
| `vortex:systems/lib/string/to_lowercase` |
| `vortex:systems/lib/string/to_lowercase_full` |
| `vortex:systems/lib/string/to_string` |
| `vortex:systems/lib/string/to_uppercase` |
| `vortex:systems/lib/string/to_uppercase_full` |
| `vortex:systems/lib/throttle` |
| `vortex:systems/lib/ticks_to_time` |
| `vortex:systems/lib/wait/cmd` |
| `vortex:systems/lib/wait/cmd_as` |
| `vortex:systems/lib/wait/run` |
| `vortex:systems/lib/wait/run_as` |
| `vortex:systems/log/add` |
| `vortex:systems/log/clear` |
| `vortex:systems/log/debug` |
| `vortex:systems/log/error` |
| `vortex:systems/log/get_level` |
| `vortex:systems/log/info` |
| `vortex:systems/log/set_level` |
| `vortex:systems/log/show` |
| `vortex:systems/log/warn` |
| `vortex:systems/logic/if_and` |
| `vortex:systems/logic/if_eq` |
| `vortex:systems/logic/if_gt` |
| `vortex:systems/logic/if_gte` |
| `vortex:systems/logic/if_lt` |
| `vortex:systems/logic/if_lte` |
| `vortex:systems/logic/if_not` |
| `vortex:systems/logic/if_not_eq` |
| `vortex:systems/logic/if_or` |
| `vortex:systems/logic/if_xor` |
| `vortex:systems/math/abs` |
| `vortex:systems/math/atan2` |
| `vortex:systems/math/average` |
| `vortex:systems/math/ceil_div` |
| `vortex:systems/math/clamp` |
| `vortex:systems/math/cos` |
| `vortex:systems/math/distance2d` |
| `vortex:systems/math/distance3d` |
| `vortex:systems/math/divmod` |
| `vortex:systems/math/factorial` |
| `vortex:systems/math/gcd` |
| `vortex:systems/math/is_between` |
| `vortex:systems/math/is_even` |
| `vortex:systems/math/lcm` |
| `vortex:systems/math/lerp` |
| `vortex:systems/math/lerp_clamped` |
| `vortex:systems/math/log2` |
| `vortex:systems/math/map` |
| `vortex:systems/math/max` |
| `vortex:systems/math/median3` |
| `vortex:systems/math/min` |
| `vortex:systems/math/minmax` |
| `vortex:systems/math/mod` |
| `vortex:systems/math/mul_div` |
| `vortex:systems/math/percent_of` |
| `vortex:systems/math/pow` |
| `vortex:systems/math/random` |
| `vortex:systems/math/ratio_percent` |
| `vortex:systems/math/round` |
| `vortex:systems/math/sign` |
| `vortex:systems/math/sign_nonzero` |
| `vortex:systems/math/sin` |
| `vortex:systems/math/sqrt` |
| `vortex:systems/math/square` |
| `vortex:systems/math/sum3` |
| `vortex:systems/math/vec/add` |
| `vortex:systems/math/vec/angle_between` |
| `vortex:systems/math/vec/cross` |
| `vortex:systems/math/vec/dot` |
| `vortex:systems/math/vec/normalize` |
| `vortex:systems/math/vec/sub` |
| `vortex:systems/math/weighted_random` |
| `vortex:systems/math/wrap` |
| `vortex:systems/rate_limit/channel/check` |
| `vortex:systems/rate_limit/check` |
| `vortex:systems/rate_limit/config` |
| `vortex:systems/rate_limit/global/check` |
| `vortex:systems/rate_limit/global/config` |
| `vortex:systems/rate_limit/player/check` |
| `vortex:systems/rate_limit/player/config` |
| `vortex:systems/rng/chance` |
| `vortex:systems/rng/coin_flip` |
| `vortex:systems/rng/dice` |
| `vortex:systems/rng/int` |
| `vortex:systems/rng/next` |
| `vortex:systems/rng/pick` |
| `vortex:systems/rng/seed` |
| `vortex:systems/rng/shuffle` |
| `vortex:systems/rng/state` |
| `vortex:systems/sound/play` |
| `vortex:systems/sound/play_at` |
| `vortex:systems/sound/stop` |
| `vortex:systems/string/announce` |
| `vortex:systems/string/announce_prefix` |
| `vortex:systems/string/format_coords` |
| `vortex:systems/string/format_number` |
| `vortex:systems/string/format_ticks` |
| `vortex:systems/string/header` |
| `vortex:systems/string/hover_text` |
| `vortex:systems/string/ordinal` |
| `vortex:systems/string/pad_left` |
| `vortex:systems/string/percent` |
| `vortex:systems/string/player_raw` |
| `vortex:systems/string/pluralize` |
| `vortex:systems/string/progress_bar` |
| `vortex:systems/string/progress_bar_self` |
| `vortex:systems/string/repeat` |
| `vortex:systems/string/roman` |
| `vortex:systems/string/roman_join` |
| `vortex:systems/string/score_display` |
| `vortex:systems/string/separator` |
| `vortex:systems/string/signed_number` |
| `vortex:systems/string/tag_badge` |
| `vortex:systems/string/tooltip_item` |
| `vortex:systems/string/truncate` |
| `vortex:systems/text/bool` |
| `vortex:systems/text/explain` |
| `vortex:systems/text/label` |
| `vortex:systems/text/show` |
| `vortex:systems/text/show_to` |
| `vortex:systems/uuid/cache_clear` |
| `vortex:systems/uuid/forget` |
| `vortex:systems/uuid/from_array` |
| `vortex:systems/uuid/from_entity` |
| `vortex:systems/uuid/has` |
| `vortex:systems/uuid/match` |
| `vortex:systems/uuid/recall` |
| `vortex:systems/uuid/recall_array` |
| `vortex:systems/uuid/store` |
| `vortex:systems/validate/_fid_loop` |
| `vortex:systems/validate/function_id` |
| `vortex:systems/validate/safe_name` |
