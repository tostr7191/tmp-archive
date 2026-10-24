param ($StageDir, $ReleaseBin, $ProjectName)

$BundleDir = "${StageDir}/red4ext/plugins/${ProjectName}/Bundle"

New-Item -ItemType directory -Force -Path ${BundleDir} | Out-Null

$PackedDir = "bundle/packed/archive/pc/mod"
$PackedArchives = @()
if (Test-Path $PackedDir) {
    $PackedArchives = @(Get-ChildItem -Path $PackedDir -File)
}

if ($PackedArchives.Count -gt 0) {
    Copy-Item -Path $PackedArchives.FullName -Destination ${BundleDir}
} else {
    Write-Warning "No packed archives in ${PackedDir}. The zip will not include ArchiveXL.archive. Pack bundle/ArchiveXL.cpmodproj with WolvenKit to add it."
}

Copy-Item -Path "bundle/source/resources/*" -Destination ${BundleDir}
