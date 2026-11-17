# ─────────────────────────────────────────────────────────────────
# vortex:systems/string/roman [MACRO]
# Converts an integer 1..3999 to a Roman numeral string.
#  Input : $(n)
# Output: vortex:output result → "XIV"; "" when n is outside 1..3999
#
# Example: function vortex:systems/string/roman {n:1994}  → "MCMXCIV"
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{string:0b} run return 0
$scoreboard players set $rm_n vortex.tmp $(n)
data modify storage vortex:output result set value ""
execute unless score $rm_n vortex.tmp matches 1..3999 run return 0

scoreboard players set $rm_1000 vortex.tmp 1000
scoreboard players set $rm_100 vortex.tmp 100
scoreboard players set $rm_10 vortex.tmp 10
scoreboard players operation $rm_t vortex.tmp = $rm_n vortex.tmp
scoreboard players operation $rm_t vortex.tmp /= $rm_1000 vortex.tmp
scoreboard players operation $rm_h vortex.tmp = $rm_n vortex.tmp
scoreboard players operation $rm_h vortex.tmp %= $rm_1000 vortex.tmp
scoreboard players operation $rm_h vortex.tmp /= $rm_100 vortex.tmp
scoreboard players operation $rm_te vortex.tmp = $rm_n vortex.tmp
scoreboard players operation $rm_te vortex.tmp %= $rm_100 vortex.tmp
scoreboard players operation $rm_te vortex.tmp /= $rm_10 vortex.tmp
scoreboard players operation $rm_o vortex.tmp = $rm_n vortex.tmp
scoreboard players operation $rm_o vortex.tmp %= $rm_10 vortex.tmp

data modify storage vortex:tmp roman set value {t:"",h:"",te:"",o:""}

# thousands
execute if score $rm_t vortex.tmp matches 1 run data modify storage vortex:tmp roman.t set value "M"
execute if score $rm_t vortex.tmp matches 2 run data modify storage vortex:tmp roman.t set value "MM"
execute if score $rm_t vortex.tmp matches 3 run data modify storage vortex:tmp roman.t set value "MMM"

# h
execute if score $rm_h vortex.tmp matches 1 run data modify storage vortex:tmp roman.h set value "C"
execute if score $rm_h vortex.tmp matches 2 run data modify storage vortex:tmp roman.h set value "CC"
execute if score $rm_h vortex.tmp matches 3 run data modify storage vortex:tmp roman.h set value "CCC"
execute if score $rm_h vortex.tmp matches 4 run data modify storage vortex:tmp roman.h set value "CD"
execute if score $rm_h vortex.tmp matches 5 run data modify storage vortex:tmp roman.h set value "D"
execute if score $rm_h vortex.tmp matches 6 run data modify storage vortex:tmp roman.h set value "DC"
execute if score $rm_h vortex.tmp matches 7 run data modify storage vortex:tmp roman.h set value "DCC"
execute if score $rm_h vortex.tmp matches 8 run data modify storage vortex:tmp roman.h set value "DCCC"
execute if score $rm_h vortex.tmp matches 9 run data modify storage vortex:tmp roman.h set value "CM"

# te
execute if score $rm_te vortex.tmp matches 1 run data modify storage vortex:tmp roman.te set value "X"
execute if score $rm_te vortex.tmp matches 2 run data modify storage vortex:tmp roman.te set value "XX"
execute if score $rm_te vortex.tmp matches 3 run data modify storage vortex:tmp roman.te set value "XXX"
execute if score $rm_te vortex.tmp matches 4 run data modify storage vortex:tmp roman.te set value "XL"
execute if score $rm_te vortex.tmp matches 5 run data modify storage vortex:tmp roman.te set value "L"
execute if score $rm_te vortex.tmp matches 6 run data modify storage vortex:tmp roman.te set value "LX"
execute if score $rm_te vortex.tmp matches 7 run data modify storage vortex:tmp roman.te set value "LXX"
execute if score $rm_te vortex.tmp matches 8 run data modify storage vortex:tmp roman.te set value "LXXX"
execute if score $rm_te vortex.tmp matches 9 run data modify storage vortex:tmp roman.te set value "XC"

# o
execute if score $rm_o vortex.tmp matches 1 run data modify storage vortex:tmp roman.o set value "I"
execute if score $rm_o vortex.tmp matches 2 run data modify storage vortex:tmp roman.o set value "II"
execute if score $rm_o vortex.tmp matches 3 run data modify storage vortex:tmp roman.o set value "III"
execute if score $rm_o vortex.tmp matches 4 run data modify storage vortex:tmp roman.o set value "IV"
execute if score $rm_o vortex.tmp matches 5 run data modify storage vortex:tmp roman.o set value "V"
execute if score $rm_o vortex.tmp matches 6 run data modify storage vortex:tmp roman.o set value "VI"
execute if score $rm_o vortex.tmp matches 7 run data modify storage vortex:tmp roman.o set value "VII"
execute if score $rm_o vortex.tmp matches 8 run data modify storage vortex:tmp roman.o set value "VIII"
execute if score $rm_o vortex.tmp matches 9 run data modify storage vortex:tmp roman.o set value "IX"

function vortex:systems/string/roman_join with storage vortex:tmp roman
data remove storage vortex:tmp roman
scoreboard players reset $rm_n vortex.tmp
scoreboard players reset $rm_t vortex.tmp
scoreboard players reset $rm_h vortex.tmp
scoreboard players reset $rm_te vortex.tmp
scoreboard players reset $rm_o vortex.tmp
scoreboard players reset $rm_1000 vortex.tmp
scoreboard players reset $rm_100 vortex.tmp
scoreboard players reset $rm_10 vortex.tmp
