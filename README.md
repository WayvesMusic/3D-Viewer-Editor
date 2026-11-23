# Model Editor skybox templates

This folder is designed to sit beside `index.html` in the website repository.

The editor expects these files at these exact paths:

- `skyboxes/studio_small_09_2k.hdr`
- `skyboxes/qwantani_puresky_2k.hdr`
- `skyboxes/qwantani_sunset_puresky_2k.hdr`
- `skyboxes/overcast_soil_puresky_2k.hdr`

All four environments are CC0 assets from Poly Haven. The source URLs, creators and MD5 checksums are listed in `manifest.json`.

## Download the actual HDR files

The HDR binaries are not included in this starter package. Run one of the scripts in this folder to download the four official 2K files into this directory:

- Windows PowerShell: `./skyboxes/download-skyboxes.ps1`
- macOS / Linux / Git Bash: `bash ./skyboxes/download-skyboxes.sh`

Then commit the downloaded `.hdr` files to GitHub along with `index.html` and this folder.

## Hosting behavior

The editor first tries the local `./skyboxes/*.hdr` files. If a file is absent, it requests the same CC0 file from Poly Haven's official download host. This means the presets are usable before you vendor the files, but committing the files makes the website self-hosted and avoids an external download when the user selects a preset.

## Licences and sources

- Studio Small 09: https://polyhaven.com/a/studio_small_09
- Qwantani (Pure Sky): https://polyhaven.com/a/qwantani_puresky
- Qwantani Sunset (Pure Sky): https://polyhaven.com/a/qwantani_sunset_puresky
- Overcast Soil (Pure Sky): https://polyhaven.com/a/overcast_soil_puresky

Each asset page identifies the HDRI as CC0. Poly Haven's CC0 assets may be used and redistributed without an attribution requirement. Source links and creator names are retained here for provenance.
