# Model Editor skybox templates

This is the `skyboxes/` folder for the WayvesMusic/3D-Viewer-Editor website.

## Files expected by the editor

The website's current skybox preset loader looks for these exact files:

- `studio_small_09_2k.hdr` — Studio Small 09
- `qwantani_puresky_2k.hdr` — Qwantani (Pure Sky)
- `qwantani_sunset_puresky_2k.hdr` — Qwantani Sunset (Pure Sky)
- `overcast_soil_puresky_2k.hdr` — Overcast Soil (Pure Sky)

## Quick setup on Windows

1. Extract this ZIP. It creates a folder named `skyboxes`.
2. Open that folder and double-click `download-skyboxes.bat`.
3. Wait for it to report that all four files have downloaded and passed checksum validation.
4. Upload the **contents** of this folder into the `skyboxes/` folder in your GitHub repository. Include the four `.hdr` files, `manifest.json`, and the documentation/scripts if you like.

If Windows blocks the script, right-click `download-skyboxes.ps1` and choose **Run with PowerShell**, or open PowerShell in this folder and run:

```powershell
.\download-skyboxes.ps1
```

## macOS / Linux / Chromebook Linux

Open a terminal in this folder and run:

```bash
bash ./download-skyboxes.sh
```

The script requires `curl` and either `md5sum` or `md5` for checksum verification.

## Repository layout

Extract this folder into the root of your repository, alongside `index.html` and `Demo.fbx`:

```text
3D-Viewer-Editor/
├── index.html
├── Demo.fbx
└── skyboxes/
    ├── README.md
    ├── LICENSES.md
    ├── manifest.json
    ├── download-skyboxes.bat
    ├── download-skyboxes.ps1
    ├── download-skyboxes.sh
    ├── studio_small_09_2k.hdr
    ├── qwantani_puresky_2k.hdr
    ├── qwantani_sunset_puresky_2k.hdr
    └── overcast_soil_puresky_2k.hdr
```

Do not move `index.html` or `Demo.fbx` into `skyboxes/`.

## Important note about this ZIP

The HDR files are large binary downloads hosted by Poly Haven. They could not be fetched into the packaging workspace, so they are **not embedded in this ZIP**. The included one-click downloader retrieves the official files and checks their MD5 hashes before reporting success. The files will then be present in this folder and ready to upload to GitHub.
