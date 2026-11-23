# vortex:api/title/show_tag_p [MACRO]
# show_p for every online player carrying a tag. Input (macro arg): tag. Storage input as show_p.
execute if data storage vortex:engine modules{title:0b} run return 0
$execute as @a[tag=$(tag)] run function vortex:api/title/show_p
