# vortex:setup — ordered load sequence (the old fake percentage output was removed:
# it printed 20+ console lines per load and reported nothing real).

# Initialization

# Step 0: Load Gate

# Step 0.5: Load Begin

# Step 1: Internal Text Module
function vortex:core/internal/text/load

# Step 2: Player Enumeration
function vortex:core/internal/player/enumerate

# Step 3: Player Resolution
function vortex:core/internal/player/resolve

# Step 4: Player Initialization
function vortex:core/internal/player/init

# Step 5: Core Main Load
function vortex:core/internal/load/main

# Step 6: Dialog Module (ported from Modalith; own objectives and storage, see CHANGELOG 0.3.0)
function vortex:core/internal/dialog/load

# Completion
execute unless entity @a run say [Vortex] loaded
