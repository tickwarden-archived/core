# vortex:core/internal/api/store/_plang_get [MACRO] [INTERNAL]
$execute if data storage vortex:store p."$(a)_$(b)_$(c)_$(d)".lang run data modify storage vortex:store tmp.langs append from storage vortex:store p."$(a)_$(b)_$(c)_$(d)".lang
