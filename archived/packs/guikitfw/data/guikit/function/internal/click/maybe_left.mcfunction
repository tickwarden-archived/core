# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
# cfg.click_detection is a list — enable left when "left" is present
execute if score @s guikit.click matches 1.. run return 0
data modify storage guikit:work det set from storage guikit:cfg click_detection
function guikit:internal/click/maybe_left_scan
