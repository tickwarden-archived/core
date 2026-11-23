# In-tree EOL installation — WIP, do not deploy

This draft applies the experimental candidates directly to 18 archived datapack locations, including both migrated Vortex source copies and the historical import copies. `installed-packs.json` maps each location to its candidate ZIP. Executable functions have an early return guard on supported modern versions or per-command gates on older versions; load/tick functions contain the 5,184,000 and 12,096,000 tick phase thresholds. The lifecycle is tick-based, not wall-clock time. Duplicate copies must not be enabled together.

This is **not a validated release**. No Minecraft server, client or bot was used. Command wrapping can change semantics; the mechanism only guards functions, not other game resources or commands, and is not a security boundary. Cleanup marks completion only; it does not clear schedules or remove persistent data because ownership is not proven. Existing installations are not automatically updated. Original source remains in Git history and the Vortex recovery bundle; independent backup packages are retained privately.

The in-tree installation has known offline validation failures and must remain draft:

* Guarding comment-only provenance watermark files violates the existing comments-only watermark invariant.
* Legacy command gating changes the format of `archive_warning.mcfunction`; existing warning validators fail and need a sound guard-aware design without weakening the original checks.
* Deriving tag layouts from every function directory creates both tag spellings in some mixed-layout packs. Version-specific layout handling must be corrected, not hidden from validation.

`installed-packs.json` and the consolidation manifest record the checked-in modifications; imported original hashes remain recorded. ZIP candidate generation expects clean original source trees, not the guarded in-tree copies. These issues must be fixed, offline checks and CI must pass, and limitations must be reviewed before this PR can be considered for merging.
