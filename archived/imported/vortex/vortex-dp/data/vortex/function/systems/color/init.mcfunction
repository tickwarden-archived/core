# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:systems/color/init
# Called during engine load. Populates the named color lookup table
# at vortex:engine color._names for O(1) validate checks.
# Also initializes the color namespace in storage.

execute unless data storage vortex:engine color run data modify storage vortex:engine color set value {}
execute unless data storage vortex:engine color.palette run data modify storage vortex:engine color.palette set value {}
execute unless data storage vortex:engine color.gradients run data modify storage vortex:engine color.gradients set value {}

# Named color allowlist — 16 Minecraft text colors
data modify storage vortex:engine color._names set value {\
  black:1b,\
  dark_blue:1b,\
  dark_green:1b,\
  dark_aqua:1b,\
  dark_red:1b,\
  dark_purple:1b,\
  gold:1b,\
  gray:1b,\
  dark_gray:1b,\
  blue:1b,\
  green:1b,\
  aqua:1b,\
  red:1b,\
  light_purple:1b,\
  yellow:1b,\
  white:1b\
}
