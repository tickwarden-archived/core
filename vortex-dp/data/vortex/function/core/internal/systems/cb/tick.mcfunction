# vortex:core/internal/systems/cb/tick
# Called each tick when cb_queue is non-empty.
# Processes all entries: decrements ticks_left, fires those that reach 0.

# Copy queue to work buffer, clear queue, rebuild after processing
data modify storage vortex:engine _cb_work set from storage vortex:engine cb_queue
data remove storage vortex:engine cb_queue
data modify storage vortex:engine cb_queue set value []

execute if data storage vortex:engine _cb_work[0] run function vortex:core/internal/systems/cb/process_step
data remove storage vortex:engine _cb_work
