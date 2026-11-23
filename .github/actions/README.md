# Public reusable GitHub Actions

These composite actions live in the public `vortaforge/core` repository. Any GitHub account or organization, including personal accounts, can reference them from a workflow after the containing commit is published. A consumer's organization Actions policy must allow public third-party actions. Marketplace registration is not required and has not been enabled.

For reproducible and safer consumption, pin the reference to the full 40-character commit SHA you have reviewed. `@main` in the examples follows new changes and should be used only if that is acceptable. Until this pull request is merged, `@main` does **not** contain these actions; a published PR commit SHA can be used for testing. No repository-specific secret, VortaForge membership or personal access token is required for these actions. Actions do not change access settings of the consumer repository. Use a read-only `GITHUB_TOKEN` unless your own workflow needs more.

## Setup toolchain

Select only the tools needed. The action does not check out code, install project dependencies, run a build, connect to a game server, or publish a release. Java and Node support version syntax accepted by the underlying setup actions. Gradle wrapper validation defaults to `true`. Python pip caching is opt-in and requires dependency files or `python-cache-dependency-path`.

```yaml
permissions:
  contents: read
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@3d3c42e5aac5ba805825da76410c181273ba90b1
        with:
          persist-credentials: false
      - uses: vortaforge/core/.github/actions/setup-toolchain@main
        id: toolchain
        with:
          python-version: '3.12'
          node-version: '24'
          java-version: '25'
          java-distribution: temurin
          gradle: 'true'
          validate-gradle-wrappers: 'true'
      - run: python --version && node --version && java -version
```

Optional outputs: `python-version`, `node-version` and `java-version`; skipped tools have empty outputs. `python-cache: 'true'` requires a Python version. `gradle: 'true'` requires Java. Inputs accepting booleans must be quoted strings `true` or `false`. Underlying setup actions are pinned by full SHA in the action metadata, but they still download tools or use caches as documented by their maintainers. Run on hosted Ubuntu with Bash; other operating systems and self-hosted runners have not been verified.

## Verify SHA-256 manifests

Generate a GNU-style `SHA256SUMS` (`sha256sum -- file1 file2 > SHA256SUMS`), then:

```yaml
      - uses: vortaforge/core/.github/actions/verify-sha256@main
        id: checksum
        with:
          directory: release-assets
          manifest: SHA256SUMS
          reject-extra: 'true'
          allow-empty: 'false'
          summary: 'true'
      - env:
          VERIFIED_COUNT: ${{ steps.checksum.outputs.files }}
        run: echo "Verified $VERIFIED_COUNT files"
```

Requires Python 3.9+ and Bash on the runner. Supports relative nested paths, rejects missing files, digest mismatches, unsafe paths, duplicate entries and symlinks; empty files are rejected by default. With `reject-extra: 'true'`, all regular files except the manifest must be listed. Outputs are `files` and `bytes`. No network, token, upload, deletion or publication is performed. This verifies integrity against the supplied manifest, not provenance: verify the manifest itself through a trusted channel.

## Repository workflows

`quality.yml`, `backup-org.yml` and `macroengine-modules.yml` use the same local toolchain action after checkout; `quality.yml` additionally verifies the generated release checksum manifest. The disabled publication job is unchanged and does not check out repository code under write permissions. Existing required job names, secret handling, deployment triggers and backup behavior remain unchanged.
