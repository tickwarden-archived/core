# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/notice/tick [INTERNAL]
# Shows vortex:api/notice/show once to every player who has not seen it. The flag is set only
# when the dialog was really shown, so a player with another dialog open is retried later.
execute as @a unless score @s vortex.notice_seen matches 1.. unless entity @s[tag=vortex.dialog_active] if function vortex:api/notice/show run scoreboard players set @s vortex.notice_seen 1
