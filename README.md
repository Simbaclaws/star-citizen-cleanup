# Star Citizen Cleanup Script

This script is meant to be run with powershell as an administrator.

It does the following:

1. **Define the install location of star citizen**\
  (this might need to be changed by you inside the script if you have star citizen installed other than program files)

2. **Remove everything within the NVIDIA cache folders**\
  (in case of a nvidia GPU)

3. **Remove every cache within the rsilauncher**

4. **Remove everything within the AMD cache folders**\
  (in case of a AMD GPU)

5. **Remove the actual shader caches of star citizen**\
  (in case of performance issues and bugs)

6. **Temporarely backup controls/mappings and profiles to your Documents**\
  (for game settings and keybinds)

7. **Remove the entire User folder of star citizen**\
  (recommended after each patch)

8. **Recreate the mappings and profiles folders and restore the files**\
  (after removing the user folder it will put back your personal game settings and keybinds)

9. **Remove the temporary backup in Documents**

## How to use this script?

install git on windows.

run:
```git clone https://github.com/Simbaclaws/star-citizen-cleanup.git```

From the "terminal" application in windows 11 with powershell.

After that, run these commands in succession:
```cd star-citizen-cleanup```

First, allow the execution policy in order to run custom scripts:
```Set-ExecutionPolicy remotesigned```

Then, run the actual script:
```./clean-sc.ps1```


### Word of advice

If you don't trust this script because you shouldn't execute things you don't know what they're doing, I will add the following paths so you can clear the folders by hand if you want to:

Your install folder is normally located at:
```C:\Program Files\Roberts Space Industries\StarCitizen\LIVE```

The nvidia caches for your nvidia gpu are normally located at:
```
%localappdata%\NVIDIA\DXCache
%localappdata%\NVIDIA\GLCache
```

The caches for the rsi launcher are normally located at:
```
%appdata%\rsilauncher\Cache
%appdata%\rsilauncher\DawnCache
%appdata%\rsilauncher\GPUCache
```

The caches for your amd gpu are normally located at:
```
%localappdata%\AMD\DXCache
%localappdata%\AMD\GLCache
```

The shader caches for star citizen are normally located here:
```
%localappdata%\star citizen
```
within this folder is a folder for the current star citizen version which starts with starcitizen_, within that folder is a shaders folder.

The settings and profiles are normally located here:
```
C:\Program Files\Roberts Space Industries\StarCitizen\LIVE\user\client\0\controls\mappings
C:\Program Files\Roberts Space Industries\StarCitizen\LIVE\user\client\0\Profiles
```

The user folder is located here:
```
C:\Program Files\Roberts Space Industries\StarCitizen\LIVE\user
```

That is all you should need to know to save your profiles, and mappings as well as clear all of the caches and user folders in case you don't trust this script.

## Issues?

If you find any issues with this script, please let me know. I also accept pull requests.
