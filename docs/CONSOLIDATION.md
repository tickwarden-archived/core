# Vortex and macroEngine Modules consolidation

This change moves the source trees to `vortaforge/core` while preserving their original main histories as merge parents. Complete observed upstream Git refs, including pull-request refs, are retained in verified recovery bundles:

- `archived/tools/vortex-source/recovery/vortex.bundle`
- `components/macroengine-modules/recovery/macroengine-modules.bundle`

Vortex datapacks, examples, scripts and two original release ZIPs are retained under `archived/tools/vortex-source/` for historical reference and are not activated or published by the root build. Its former `.github/` files live under the inert `ci-source/` directory; `CONSOLIDATION-SOURCES.json` maps every source path and its SHA-256 to its destination. Experimental EOL guards have since been applied to the archived source copies in this draft; they do not modify existing installations. See `archived/eol-kit/INSTALLED-WIP.md` for limitations.

`components/macroengine-modules/` is an isolated, still-buildable Fabric module project. Its mixed-use splitter generates intermediate data resources for Fabric builds, rather than reactivating the standalone datapack programme. The original nested workflows remain as inert records; the root `.github/workflows/macroengine-modules.yml` tests the module build in a temporary directory without running a Minecraft server. It uploads short-lived CI build artifacts for review but does not publish releases. The historical public API remains unchanged; the player-name and queue hook targets were corrected to match the current source and are covered by offline tests.

This repository does **not** claim to recreate GitHub issue/PR objects, Actions runs, settings, secrets, access rules or release records. Original release files are retained, but their former release URLs and any external links to deleted repositories would stop working if those repositories are deleted. GitHub service metadata and Actions backup are separate private recovery material. Git bundles restore refs and Git objects, not the full hosting service.

No Minecraft server tests or bot/client connections are permitted. Offline checks and Fabric jar builds do not establish actual in-game behavior.
