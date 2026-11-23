# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
# kind "confirm" — jump to confirm_page (guigen confirm_page)
execute if data storage guikit:act w.confirm_page store result score @s guikit.page run data get storage guikit:act w.confirm_page
execute if data storage guikit:act w.to store result score @s guikit.page run data get storage guikit:act w.to
