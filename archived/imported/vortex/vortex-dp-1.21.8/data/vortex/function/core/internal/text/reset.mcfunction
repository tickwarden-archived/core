# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/text/reset
# Drops the working buffers of the text module. Callers copy their result out first.
data remove storage vortex:text s
data remove storage vortex:text needle
data remove storage vortex:text rep
data remove storage vortex:text n
data remove storage vortex:text idx
data remove storage vortex:text pc
data remove storage vortex:text nl
data remove storage vortex:text cl
data remove storage vortex:text win
data remove storage vortex:text cmp
data remove storage vortex:text sf
data remove storage vortex:text sc
data remove storage vortex:text sq
data remove storage vortex:text cf
data remove storage vortex:text out
data remove storage vortex:text err
data remove storage vortex:text list
data remove storage vortex:text ins
data remove storage vortex:text at
data remove storage vortex:text sep
data remove storage vortex:text keep_empty
data remove storage vortex:text in
data remove storage vortex:text tbl
data remove storage vortex:text allow_dot
data remove storage vortex:text arg
data remove storage vortex:text jarg
data remove storage vortex:text jout
data remove storage vortex:text mp
data remove storage vortex:text ch
data remove storage vortex:text r
data remove storage vortex:text isd
