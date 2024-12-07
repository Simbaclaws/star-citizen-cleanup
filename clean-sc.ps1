# Define the install location variable (adjust this to your install path)
$installLocation = "C:\Program Files\Roberts Space Industries\StarCitizen\LIVE"

# Remove everything within the NVIDIA cache (in case of NVIDIA GPU)
Remove-Item -Path "$env:LocalAppData\NVIDIA\DXCache" -Recurse -Force
Remove-Item -Path "$env:LocalAppData\NVIDIA\GLCache" -Recurse -Force

# Remove everything in the rsilauncher cache
Remove-Item -Path "$env:AppData\rsilauncher\Cache" -Recurse -Force
Remove-Item -Path "$env:AppData\rsilauncher\DawnCache" -Recurse -Force
Remove-Item -Path "$env:AppData\rsilauncher\GPUCache" -Recurse -Force

# Remove everything within the AMD cache (in case of AMD GPU)
Remove-Item -Path "$env:LocalAppData\AMD\DxCache" -Recurse -Force
Remove-Item -Path "$env:LocalAppData\AMD\GLCache" -Recurse -Force

# Remove the shader caches of star citizen
$starCitizenPath = "$env:LocalAppData\star citizen"
$shaderFolders = Get-ChildItem -Path $starCitizenPath -Filter "starcitizen_*" -Directory

foreach ($folder in $shaderFolders) {
    $shaderPath = Join-Path -Path $folder.FullName -ChildPath "shaders"
    if (Test-Path -Path $shaderPath) {
        Remove-Item -Path $shaderPath\* -Recurse -Force
    }
}

# Temporarily copy everything in 'controls\mappings' and 'Profiles' to '~/Documents'
$controlsSourcePath = Join-Path -Path $installLocation -ChildPath "user\client\0\controls\mappings"
$profilesSourcePath = Join-Path -Path $installLocation -ChildPath "user\client\0\Profiles"
$profilesSourcePath = Join-Path -Path $installLocation -ChildPath "user\client\0\CustomCharacters"
$destinationPath = [System.IO.Path]::Combine([System.Environment]::GetFolderPath("MyDocuments"), "StarCitizenBackup")
Copy-Item -Path $controlsSourcePath -Destination $destinationPath -Recurse -Force
Copy-Item -Path $profilesSourcePath -Destination $destinationPath -Recurse -Force

# Remove the 'user' folder
Remove-Item -Path (Join-Path -Path $installLocation -ChildPath "user") -Recurse -Force

# Recreate the 'controls\mappings' and 'Profiles' folders and restore the files
$controlsRestorePath = Join-Path -Path $installLocation -ChildPath "user\client\0\controls\mappings"
$profilesRestorePath = Join-Path -Path $installLocation -ChildPath "user\client\0\Profiles"
$profilesRestorePath = Join-Path -Path $installLocation -ChildPath "user\client\0\CustomCharacters"
New-Item -ItemType Directory -Path $controlsRestorePath -Force
New-Item -ItemType Directory -Path $profilesRestorePath -Force
Copy-Item -Path "$destinationPath\mappings\*" -Destination $controlsRestorePath -Recurse -Force
Copy-Item -Path "$destinationPath\Profiles\*" -Destination $profilesRestorePath -Recurse -Force
Copy-Item -Path "$destinationPath\CustomCharacters\*" -Destination $profilesRestorePath -Recurse -Force
# Remove the backup folders from '~/Documents'
Remove-Item -Path $destinationPath -Recurse -Force