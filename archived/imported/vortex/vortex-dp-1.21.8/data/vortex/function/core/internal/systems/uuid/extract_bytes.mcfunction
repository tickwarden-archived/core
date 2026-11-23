# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ============================================================
# vortex:systems/uuid/internal/extract_bytes
# Splits 4 UUID ints into 16 bytes (correct signed integer arithmetic)
#
# REQUIREMENT: The following fake-player scores must be set:
# $uuid.0 $uuid.1 $uuid.2 $uuid.3 vortex.tmp
# $uuid.256 vortex.tmp = 256 (set by init)
#
# OUTPUT: storage vortex:uuid _tmp
# Fields 0..3 → bytes of int 0 (0=LSB, 3=MSB)
# Fields 4..7 → bytes of int 1
# Fields 8..b → bytes of int 2
# Fields c..f → bytes of int 3
# Each field is guaranteed to be in range 0–255.
#
# NEDEN GU'DAN FARKLI?
# Java's `/` operator truncates toward zero for negative dividends.
# Example: -1 / 256 = 0 (floor should be -1).
# GU does not handle this; high bytes of negative ints are computed incorrectly.
# This function correctly extracts each byte using floor-division:
#
# b_raw = v % 256 (Java mod, range -255..255)
# if b_raw < 0:
# v = (v / 256) - 1 (correction for floor division)
# b = b_raw + 256 (normalize to 0..255)
# else:
# v = v / 256
# b = b_raw
# ============================================================

# --- INT 0 (first 4 bytes of UUID, fields 0..3) ---

# byte 0 — LSB
scoreboard players operation $uuid.a vortex.tmp = $uuid.0 vortex.tmp
scoreboard players operation $uuid.a vortex.tmp %= $uuid.256 vortex.tmp
scoreboard players operation $uuid.0 vortex.tmp /= $uuid.256 vortex.tmp
execute if score $uuid.a vortex.tmp matches ..-1 run scoreboard players remove $uuid.0 vortex.tmp 1
execute if score $uuid.a vortex.tmp matches ..-1 run scoreboard players add $uuid.a vortex.tmp 256
execute store result storage vortex:uuid _tmp.0 int 1 run scoreboard players get $uuid.a vortex.tmp

# byte 1
scoreboard players operation $uuid.a vortex.tmp = $uuid.0 vortex.tmp
scoreboard players operation $uuid.a vortex.tmp %= $uuid.256 vortex.tmp
scoreboard players operation $uuid.0 vortex.tmp /= $uuid.256 vortex.tmp
execute if score $uuid.a vortex.tmp matches ..-1 run scoreboard players remove $uuid.0 vortex.tmp 1
execute if score $uuid.a vortex.tmp matches ..-1 run scoreboard players add $uuid.a vortex.tmp 256
execute store result storage vortex:uuid _tmp.1 int 1 run scoreboard players get $uuid.a vortex.tmp

# byte 2
scoreboard players operation $uuid.a vortex.tmp = $uuid.0 vortex.tmp
scoreboard players operation $uuid.a vortex.tmp %= $uuid.256 vortex.tmp
scoreboard players operation $uuid.0 vortex.tmp /= $uuid.256 vortex.tmp
execute if score $uuid.a vortex.tmp matches ..-1 run scoreboard players remove $uuid.0 vortex.tmp 1
execute if score $uuid.a vortex.tmp matches ..-1 run scoreboard players add $uuid.a vortex.tmp 256
execute store result storage vortex:uuid _tmp.2 int 1 run scoreboard players get $uuid.a vortex.tmp

# byte 3 — MSB (last byte, no division)
scoreboard players operation $uuid.a vortex.tmp = $uuid.0 vortex.tmp
scoreboard players operation $uuid.a vortex.tmp %= $uuid.256 vortex.tmp
execute if score $uuid.a vortex.tmp matches ..-1 run scoreboard players add $uuid.a vortex.tmp 256
execute store result storage vortex:uuid _tmp.3 int 1 run scoreboard players get $uuid.a vortex.tmp

# --- INT 1 (alanlar 4..7) ---

# byte 0 — LSB
scoreboard players operation $uuid.a vortex.tmp = $uuid.1 vortex.tmp
scoreboard players operation $uuid.a vortex.tmp %= $uuid.256 vortex.tmp
scoreboard players operation $uuid.1 vortex.tmp /= $uuid.256 vortex.tmp
execute if score $uuid.a vortex.tmp matches ..-1 run scoreboard players remove $uuid.1 vortex.tmp 1
execute if score $uuid.a vortex.tmp matches ..-1 run scoreboard players add $uuid.a vortex.tmp 256
execute store result storage vortex:uuid _tmp.4 int 1 run scoreboard players get $uuid.a vortex.tmp

# byte 1
scoreboard players operation $uuid.a vortex.tmp = $uuid.1 vortex.tmp
scoreboard players operation $uuid.a vortex.tmp %= $uuid.256 vortex.tmp
scoreboard players operation $uuid.1 vortex.tmp /= $uuid.256 vortex.tmp
execute if score $uuid.a vortex.tmp matches ..-1 run scoreboard players remove $uuid.1 vortex.tmp 1
execute if score $uuid.a vortex.tmp matches ..-1 run scoreboard players add $uuid.a vortex.tmp 256
execute store result storage vortex:uuid _tmp.5 int 1 run scoreboard players get $uuid.a vortex.tmp

# byte 2
scoreboard players operation $uuid.a vortex.tmp = $uuid.1 vortex.tmp
scoreboard players operation $uuid.a vortex.tmp %= $uuid.256 vortex.tmp
scoreboard players operation $uuid.1 vortex.tmp /= $uuid.256 vortex.tmp
execute if score $uuid.a vortex.tmp matches ..-1 run scoreboard players remove $uuid.1 vortex.tmp 1
execute if score $uuid.a vortex.tmp matches ..-1 run scoreboard players add $uuid.a vortex.tmp 256
execute store result storage vortex:uuid _tmp.6 int 1 run scoreboard players get $uuid.a vortex.tmp

# byte 3 — MSB
scoreboard players operation $uuid.a vortex.tmp = $uuid.1 vortex.tmp
scoreboard players operation $uuid.a vortex.tmp %= $uuid.256 vortex.tmp
execute if score $uuid.a vortex.tmp matches ..-1 run scoreboard players add $uuid.a vortex.tmp 256
execute store result storage vortex:uuid _tmp.7 int 1 run scoreboard players get $uuid.a vortex.tmp

# --- INT 2 (alanlar 8..b) ---

# byte 0 — LSB
scoreboard players operation $uuid.a vortex.tmp = $uuid.2 vortex.tmp
scoreboard players operation $uuid.a vortex.tmp %= $uuid.256 vortex.tmp
scoreboard players operation $uuid.2 vortex.tmp /= $uuid.256 vortex.tmp
execute if score $uuid.a vortex.tmp matches ..-1 run scoreboard players remove $uuid.2 vortex.tmp 1
execute if score $uuid.a vortex.tmp matches ..-1 run scoreboard players add $uuid.a vortex.tmp 256
execute store result storage vortex:uuid _tmp.8 int 1 run scoreboard players get $uuid.a vortex.tmp

# byte 1
scoreboard players operation $uuid.a vortex.tmp = $uuid.2 vortex.tmp
scoreboard players operation $uuid.a vortex.tmp %= $uuid.256 vortex.tmp
scoreboard players operation $uuid.2 vortex.tmp /= $uuid.256 vortex.tmp
execute if score $uuid.a vortex.tmp matches ..-1 run scoreboard players remove $uuid.2 vortex.tmp 1
execute if score $uuid.a vortex.tmp matches ..-1 run scoreboard players add $uuid.a vortex.tmp 256
execute store result storage vortex:uuid _tmp.9 int 1 run scoreboard players get $uuid.a vortex.tmp

# byte 2
scoreboard players operation $uuid.a vortex.tmp = $uuid.2 vortex.tmp
scoreboard players operation $uuid.a vortex.tmp %= $uuid.256 vortex.tmp
scoreboard players operation $uuid.2 vortex.tmp /= $uuid.256 vortex.tmp
execute if score $uuid.a vortex.tmp matches ..-1 run scoreboard players remove $uuid.2 vortex.tmp 1
execute if score $uuid.a vortex.tmp matches ..-1 run scoreboard players add $uuid.a vortex.tmp 256
execute store result storage vortex:uuid _tmp.a int 1 run scoreboard players get $uuid.a vortex.tmp

# byte 3 — MSB
scoreboard players operation $uuid.a vortex.tmp = $uuid.2 vortex.tmp
scoreboard players operation $uuid.a vortex.tmp %= $uuid.256 vortex.tmp
execute if score $uuid.a vortex.tmp matches ..-1 run scoreboard players add $uuid.a vortex.tmp 256
execute store result storage vortex:uuid _tmp.b int 1 run scoreboard players get $uuid.a vortex.tmp

# --- INT 3 (alanlar c..f) ---

# byte 0 — LSB
scoreboard players operation $uuid.a vortex.tmp = $uuid.3 vortex.tmp
scoreboard players operation $uuid.a vortex.tmp %= $uuid.256 vortex.tmp
scoreboard players operation $uuid.3 vortex.tmp /= $uuid.256 vortex.tmp
execute if score $uuid.a vortex.tmp matches ..-1 run scoreboard players remove $uuid.3 vortex.tmp 1
execute if score $uuid.a vortex.tmp matches ..-1 run scoreboard players add $uuid.a vortex.tmp 256
execute store result storage vortex:uuid _tmp.c int 1 run scoreboard players get $uuid.a vortex.tmp

# byte 1
scoreboard players operation $uuid.a vortex.tmp = $uuid.3 vortex.tmp
scoreboard players operation $uuid.a vortex.tmp %= $uuid.256 vortex.tmp
scoreboard players operation $uuid.3 vortex.tmp /= $uuid.256 vortex.tmp
execute if score $uuid.a vortex.tmp matches ..-1 run scoreboard players remove $uuid.3 vortex.tmp 1
execute if score $uuid.a vortex.tmp matches ..-1 run scoreboard players add $uuid.a vortex.tmp 256
execute store result storage vortex:uuid _tmp.d int 1 run scoreboard players get $uuid.a vortex.tmp

# byte 2
scoreboard players operation $uuid.a vortex.tmp = $uuid.3 vortex.tmp
scoreboard players operation $uuid.a vortex.tmp %= $uuid.256 vortex.tmp
scoreboard players operation $uuid.3 vortex.tmp /= $uuid.256 vortex.tmp
execute if score $uuid.a vortex.tmp matches ..-1 run scoreboard players remove $uuid.3 vortex.tmp 1
execute if score $uuid.a vortex.tmp matches ..-1 run scoreboard players add $uuid.a vortex.tmp 256
execute store result storage vortex:uuid _tmp.e int 1 run scoreboard players get $uuid.a vortex.tmp

# byte 3 — MSB
scoreboard players operation $uuid.a vortex.tmp = $uuid.3 vortex.tmp
scoreboard players operation $uuid.a vortex.tmp %= $uuid.256 vortex.tmp
execute if score $uuid.a vortex.tmp matches ..-1 run scoreboard players add $uuid.a vortex.tmp 256
execute store result storage vortex:uuid _tmp.f int 1 run scoreboard players get $uuid.a vortex.tmp
