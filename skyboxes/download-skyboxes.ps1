$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$base = 'https://dl.polyhaven.org/file/ph-assets/HDRIs/hdr/2k'
$assets = @(
    @{ File = 'studio_small_09_2k.hdr'; Md5 = 'b056fea247bc84b81d2e0987d44c87d8'; Source = 'https://polyhaven.com/a/studio_small_09' },
    @{ File = 'qwantani_puresky_2k.hdr'; Md5 = 'fdd877b7d1440ef299516653358d7f67'; Source = 'https://polyhaven.com/a/qwantani_puresky' },
    @{ File = 'qwantani_sunset_puresky_2k.hdr'; Md5 = 'b918af5fefb341535961ffdad5fab7bc'; Source = 'https://polyhaven.com/a/qwantani_sunset_puresky' },
    @{ File = 'overcast_soil_puresky_2k.hdr'; Md5 = '877caf0680d7269037995f6567a67103'; Source = 'https://polyhaven.com/a/overcast_soil_puresky' }
)

Write-Host 'Downloading four CC0 HDR skyboxes from Poly Haven...' -ForegroundColor Cyan
foreach ($asset in $assets) {
    $destination = Join-Path $scriptDir $asset.File
    Write-Host "`nDownloading $($asset.File)..."
    Invoke-WebRequest -Uri "$base/$($asset.File)" -OutFile $destination
    $actual = (Get-FileHash -Path $destination -Algorithm MD5).Hash.ToLowerInvariant()
    if ($actual -ne $asset.Md5) {
        Remove-Item -LiteralPath $destination -Force -ErrorAction SilentlyContinue
        throw "Checksum mismatch for $($asset.File). The incomplete file has been removed."
    }
    $sizeMB = [Math]::Round((Get-Item $destination).Length / 1MB, 2)
    Write-Host "Verified $($asset.File) ($sizeMB MB)" -ForegroundColor Green
}
Write-Host "`nAll four HDR files downloaded and verified in:`n$scriptDir" -ForegroundColor Green
Write-Host 'Upload these four .hdr files into the skyboxes/ folder in your GitHub repository.'
