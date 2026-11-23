# EOL entry guard; legacy Minecraft requires each command to be gated.
# Merge in.data into args (creates args if missing)
execute if data storage vf_eol_5f312cf5a6:lifecycle {phase:1} run execute if data storage vf_macro:in data run data modify storage vf_macro:args {} merge from storage vf_macro:in data
