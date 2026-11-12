# vortex:player/team/set_color [MACRO]
$team modify $(team) color $(color)
$data modify storage vortex:engine teams.$(team).color set value "$(color)"
