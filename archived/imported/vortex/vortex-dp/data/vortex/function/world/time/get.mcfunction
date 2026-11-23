# vortex:world/time/get
# 26.x ("World Clocks") grammar: `time query day` returns the ticks elapsed
# in the current repetition of the minecraft:day timeline (= daytime,
# 0..23999), and `time query day repetition` returns the day count. The old
# `time query daytime` argument no longer exists.
execute store result storage vortex:output daytime int 1 run time query day
execute store result storage vortex:output total int 1 run time query gametime
execute store result storage vortex:output day int 1 run time query day repetition
