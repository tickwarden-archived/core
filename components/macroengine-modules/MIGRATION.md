# Location in vortaforge/core

This directory contains the macroengine-modules project, including its own standalone Gradle build and Fabric-module generator. It remains separate from the root Gradle scan, so the move does not silently change existing `mods/` projects or their build.

The source pack used to generate the modules is at `../../archived/packs/macroEngine-Datapack-v26.3`. To build, copy this component to a separate writable work directory, then run `python3 tools/split.py --source /absolute/path/to/core/archived/packs/macroEngine-Datapack-v26.3 --out . --in-place` followed by `./gradlew check dist` with Java 25. The generated `packs/` directory is an intermediate of the Fabric-mod build and is not committed or published as a datapack by core. This retains the original project's build behavior; it does not assert that its resulting Fabric jars contain no data resources.

The root `macroengine-modules.yml` runs the build in a runner temporary directory without starting a Minecraft server or connecting a game client. The nested upstream `.github/workflows/` files are preserved as historical references; they are not GitHub Actions workflows in this location. Publication is not automatic. Recovery bundle and original refs are in `recovery/`.
