# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:systems/math/sin [MACRO]
execute if data storage vortex:engine modules{math:0b} run return 0
$scoreboard players set $sin_d vortex.tmp $(deg)

# Wrap to range 0-359
scoreboard players set $sin_360 vortex.tmp 360
scoreboard players operation $sin_d vortex.tmp %= $sin_360 vortex.tmp
execute if score $sin_d vortex.tmp matches ..-1 run scoreboard players operation $sin_d vortex.tmp += $sin_360 vortex.tmp

# Sign: 180-359 → negative
scoreboard players set $sin_nf vortex.tmp 1
execute if score $sin_d vortex.tmp matches 180..359 run scoreboard players set $sin_nf vortex.tmp -1
# 180-359 → map down to 0-179
execute if score $sin_d vortex.tmp matches 180..359 run scoreboard players remove $sin_d vortex.tmp 180

# 91-179 → symmetry: sin(deg) = sin(180-deg)
# tmp2 = 180 - sin_d (only for range 91-179)
scoreboard players set $sin_180 vortex.tmp 180
execute if score $sin_d vortex.tmp matches 91..179 run scoreboard players operation $sin_180 vortex.tmp -= $sin_d vortex.tmp
execute if score $sin_d vortex.tmp matches 91..179 run scoreboard players operation $sin_d vortex.tmp = $sin_180 vortex.tmp

# Lookup table 0-90 → sin × 1000
execute if score $sin_d vortex.tmp matches 0 run scoreboard players set $sin_r vortex.tmp 0
execute if score $sin_d vortex.tmp matches 1 run scoreboard players set $sin_r vortex.tmp 17
execute if score $sin_d vortex.tmp matches 2 run scoreboard players set $sin_r vortex.tmp 35
execute if score $sin_d vortex.tmp matches 3 run scoreboard players set $sin_r vortex.tmp 52
execute if score $sin_d vortex.tmp matches 4 run scoreboard players set $sin_r vortex.tmp 70
execute if score $sin_d vortex.tmp matches 5 run scoreboard players set $sin_r vortex.tmp 87
execute if score $sin_d vortex.tmp matches 6 run scoreboard players set $sin_r vortex.tmp 105
execute if score $sin_d vortex.tmp matches 7 run scoreboard players set $sin_r vortex.tmp 122
execute if score $sin_d vortex.tmp matches 8 run scoreboard players set $sin_r vortex.tmp 139
execute if score $sin_d vortex.tmp matches 9 run scoreboard players set $sin_r vortex.tmp 156
execute if score $sin_d vortex.tmp matches 10 run scoreboard players set $sin_r vortex.tmp 174
execute if score $sin_d vortex.tmp matches 11 run scoreboard players set $sin_r vortex.tmp 191
execute if score $sin_d vortex.tmp matches 12 run scoreboard players set $sin_r vortex.tmp 208
execute if score $sin_d vortex.tmp matches 13 run scoreboard players set $sin_r vortex.tmp 225
execute if score $sin_d vortex.tmp matches 14 run scoreboard players set $sin_r vortex.tmp 242
execute if score $sin_d vortex.tmp matches 15 run scoreboard players set $sin_r vortex.tmp 259
execute if score $sin_d vortex.tmp matches 16 run scoreboard players set $sin_r vortex.tmp 276
execute if score $sin_d vortex.tmp matches 17 run scoreboard players set $sin_r vortex.tmp 292
execute if score $sin_d vortex.tmp matches 18 run scoreboard players set $sin_r vortex.tmp 309
execute if score $sin_d vortex.tmp matches 19 run scoreboard players set $sin_r vortex.tmp 326
execute if score $sin_d vortex.tmp matches 20 run scoreboard players set $sin_r vortex.tmp 342
execute if score $sin_d vortex.tmp matches 21 run scoreboard players set $sin_r vortex.tmp 358
execute if score $sin_d vortex.tmp matches 22 run scoreboard players set $sin_r vortex.tmp 375
execute if score $sin_d vortex.tmp matches 23 run scoreboard players set $sin_r vortex.tmp 391
execute if score $sin_d vortex.tmp matches 24 run scoreboard players set $sin_r vortex.tmp 407
execute if score $sin_d vortex.tmp matches 25 run scoreboard players set $sin_r vortex.tmp 423
execute if score $sin_d vortex.tmp matches 26 run scoreboard players set $sin_r vortex.tmp 438
execute if score $sin_d vortex.tmp matches 27 run scoreboard players set $sin_r vortex.tmp 454
execute if score $sin_d vortex.tmp matches 28 run scoreboard players set $sin_r vortex.tmp 469
execute if score $sin_d vortex.tmp matches 29 run scoreboard players set $sin_r vortex.tmp 485
execute if score $sin_d vortex.tmp matches 30 run scoreboard players set $sin_r vortex.tmp 500
execute if score $sin_d vortex.tmp matches 31 run scoreboard players set $sin_r vortex.tmp 515
execute if score $sin_d vortex.tmp matches 32 run scoreboard players set $sin_r vortex.tmp 530
execute if score $sin_d vortex.tmp matches 33 run scoreboard players set $sin_r vortex.tmp 545
execute if score $sin_d vortex.tmp matches 34 run scoreboard players set $sin_r vortex.tmp 559
execute if score $sin_d vortex.tmp matches 35 run scoreboard players set $sin_r vortex.tmp 574
execute if score $sin_d vortex.tmp matches 36 run scoreboard players set $sin_r vortex.tmp 588
execute if score $sin_d vortex.tmp matches 37 run scoreboard players set $sin_r vortex.tmp 602
execute if score $sin_d vortex.tmp matches 38 run scoreboard players set $sin_r vortex.tmp 616
execute if score $sin_d vortex.tmp matches 39 run scoreboard players set $sin_r vortex.tmp 629
execute if score $sin_d vortex.tmp matches 40 run scoreboard players set $sin_r vortex.tmp 643
execute if score $sin_d vortex.tmp matches 41 run scoreboard players set $sin_r vortex.tmp 656
execute if score $sin_d vortex.tmp matches 42 run scoreboard players set $sin_r vortex.tmp 669
execute if score $sin_d vortex.tmp matches 43 run scoreboard players set $sin_r vortex.tmp 682
execute if score $sin_d vortex.tmp matches 44 run scoreboard players set $sin_r vortex.tmp 695
execute if score $sin_d vortex.tmp matches 45 run scoreboard players set $sin_r vortex.tmp 707
execute if score $sin_d vortex.tmp matches 46 run scoreboard players set $sin_r vortex.tmp 719
execute if score $sin_d vortex.tmp matches 47 run scoreboard players set $sin_r vortex.tmp 731
execute if score $sin_d vortex.tmp matches 48 run scoreboard players set $sin_r vortex.tmp 743
execute if score $sin_d vortex.tmp matches 49 run scoreboard players set $sin_r vortex.tmp 755
execute if score $sin_d vortex.tmp matches 50 run scoreboard players set $sin_r vortex.tmp 766
execute if score $sin_d vortex.tmp matches 51 run scoreboard players set $sin_r vortex.tmp 777
execute if score $sin_d vortex.tmp matches 52 run scoreboard players set $sin_r vortex.tmp 788
execute if score $sin_d vortex.tmp matches 53 run scoreboard players set $sin_r vortex.tmp 799
execute if score $sin_d vortex.tmp matches 54 run scoreboard players set $sin_r vortex.tmp 809
execute if score $sin_d vortex.tmp matches 55 run scoreboard players set $sin_r vortex.tmp 819
execute if score $sin_d vortex.tmp matches 56 run scoreboard players set $sin_r vortex.tmp 829
execute if score $sin_d vortex.tmp matches 57 run scoreboard players set $sin_r vortex.tmp 839
execute if score $sin_d vortex.tmp matches 58 run scoreboard players set $sin_r vortex.tmp 848
execute if score $sin_d vortex.tmp matches 59 run scoreboard players set $sin_r vortex.tmp 857
execute if score $sin_d vortex.tmp matches 60 run scoreboard players set $sin_r vortex.tmp 866
execute if score $sin_d vortex.tmp matches 61 run scoreboard players set $sin_r vortex.tmp 875
execute if score $sin_d vortex.tmp matches 62 run scoreboard players set $sin_r vortex.tmp 883
execute if score $sin_d vortex.tmp matches 63 run scoreboard players set $sin_r vortex.tmp 891
execute if score $sin_d vortex.tmp matches 64 run scoreboard players set $sin_r vortex.tmp 899
execute if score $sin_d vortex.tmp matches 65 run scoreboard players set $sin_r vortex.tmp 906
execute if score $sin_d vortex.tmp matches 66 run scoreboard players set $sin_r vortex.tmp 914
execute if score $sin_d vortex.tmp matches 67 run scoreboard players set $sin_r vortex.tmp 921
execute if score $sin_d vortex.tmp matches 68 run scoreboard players set $sin_r vortex.tmp 927
execute if score $sin_d vortex.tmp matches 69 run scoreboard players set $sin_r vortex.tmp 934
execute if score $sin_d vortex.tmp matches 70 run scoreboard players set $sin_r vortex.tmp 940
execute if score $sin_d vortex.tmp matches 71 run scoreboard players set $sin_r vortex.tmp 946
execute if score $sin_d vortex.tmp matches 72 run scoreboard players set $sin_r vortex.tmp 951
execute if score $sin_d vortex.tmp matches 73 run scoreboard players set $sin_r vortex.tmp 956
execute if score $sin_d vortex.tmp matches 74 run scoreboard players set $sin_r vortex.tmp 961
execute if score $sin_d vortex.tmp matches 75 run scoreboard players set $sin_r vortex.tmp 966
execute if score $sin_d vortex.tmp matches 76 run scoreboard players set $sin_r vortex.tmp 970
execute if score $sin_d vortex.tmp matches 77 run scoreboard players set $sin_r vortex.tmp 974
execute if score $sin_d vortex.tmp matches 78 run scoreboard players set $sin_r vortex.tmp 978
execute if score $sin_d vortex.tmp matches 79 run scoreboard players set $sin_r vortex.tmp 982
execute if score $sin_d vortex.tmp matches 80 run scoreboard players set $sin_r vortex.tmp 985
execute if score $sin_d vortex.tmp matches 81 run scoreboard players set $sin_r vortex.tmp 988
execute if score $sin_d vortex.tmp matches 82 run scoreboard players set $sin_r vortex.tmp 990
execute if score $sin_d vortex.tmp matches 83 run scoreboard players set $sin_r vortex.tmp 993
execute if score $sin_d vortex.tmp matches 84 run scoreboard players set $sin_r vortex.tmp 995
execute if score $sin_d vortex.tmp matches 85 run scoreboard players set $sin_r vortex.tmp 996
execute if score $sin_d vortex.tmp matches 86 run scoreboard players set $sin_r vortex.tmp 998
execute if score $sin_d vortex.tmp matches 87 run scoreboard players set $sin_r vortex.tmp 999
execute if score $sin_d vortex.tmp matches 88 run scoreboard players set $sin_r vortex.tmp 999
execute if score $sin_d vortex.tmp matches 89 run scoreboard players set $sin_r vortex.tmp 1000
execute if score $sin_d vortex.tmp matches 90 run scoreboard players set $sin_r vortex.tmp 1000

scoreboard players operation $sin_r vortex.tmp *= $sin_nf vortex.tmp
execute store result storage vortex:output result int 1 run scoreboard players get $sin_r vortex.tmp
