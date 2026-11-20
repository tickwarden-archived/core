# vortex:api/player/team/create [MACRO]
$team add $(team)
$data modify storage vortex:engine teams.$(team) set value {color:"white",friendly_fire:"true",see_friendly_invisibles:"false"}
