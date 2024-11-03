# GetWinIcons
GetWinIcons is a repository for a batch script that extracts icons from DLL files. <br>
It uses a program from NirSoft called [IconsExtract](https://www.nirsoft.net/utils/iconsext.html) to extract the icons themselves. <br>
Additionally, the extracted icons contain the index they are located at in the DLL file itself, if that's what you need. <br>

# How does it work?
When running the script without any parameters, you get this help text:
```
This script extracts icons from any DLL located in the System32 folder.

Usage: get_icons.bat [dll]

Parameters:
  dll - The name of the library to operate on.

Example: get_icons.bat imageres.dll
```
By default, this script looks for DLL files located in C:\Windows\System32. <br>
If the DLL file has no icons or the path does not point to a DLL file, then the folder will be empty. <br>
Once extracted, an Explorer window will open up to the folder.

# Screenshots
![image](https://github.com/user-attachments/assets/797d7ca1-8860-44f0-84e6-d832f9b3485e "A screenshot of the 'extracted' folder's contents.")
