# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_402f6da28f:lifecycle {phase:1} run return 0
#> left_click_detection:core/declare
# @private

#>
# @within left_click_detection:**
    #declare tag LCD.Player
    #declare tag LCD.Entity
