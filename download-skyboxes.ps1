$ErrorActionPreference = 'Stop'
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$base = 'https://dl.polyhaven.org/file/ph-assets/HDRIs/hdr/2k'
$assets = @(
    @{ File = 'studio_small_09_2k.hdr'; Md5 = 'b056fea247bc84b81d2e0987d44c87d8' },
    @{ File = 'qwantani_puresky_2k.hdr'; Md5 = 'fdd877b7d1440ef299516653358d7f67' },
    @{ File = 'qwantani_sunset_puresky_2k.hdr'; Md5 = 'b918af5fefb341535961ffdad5fab7bc' },
    @{ File = 'overcast_soil_puresky_2k.hdr'; Md5 = '877caf0680d7269037995f6567a67103' }
)
New-Item -ItemType Directory -Force -Path $scriptDir | Out-Null
foreach ($asset in $assets) {
    $destination = Join-Path $scriptDir $asset.File
    Write-Host "Downloading $($asset.File) ..."
    Invoke-WebRequest -Uri "$base/$($asset.File)" -OutFile $destination
    $actual = (Get-FileHash -Path $destination -Algorithm MD5).Hash.ToLowerInvariant()
    if ($actual -ne $asset.Md5) { throw "Checksum mismatch for $($asset.File)" }
}
Write-Host "All four CC0 HDRI templates are ready in $scriptDir"
