# Zephyr CI Image
## Usage:
The Image has a pre-prepared zephyr workspace at /workdir. Simply copy your repository into the workspace, init and update west, then do your thing.

Setup Image in CI:
- `cp -r . /workdir/app`
- `cd /workdir`
- `west init -l ./app`
- `west-update-with-retry`
- `west build ...`
