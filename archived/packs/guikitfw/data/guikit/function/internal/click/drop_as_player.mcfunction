# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
# Drop already consumed item entity; treat as shift click on matching id if present in actions
# Full port uses item NBT; here re-scan inv is empty — use left empty slots next tick instead
scoreboard players set @s guikit.click 0
