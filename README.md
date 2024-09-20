# FPWEB node_modules Remover

`FPWEB node_modules remover` is a simple PowerShell script designed to recursively search through a specified directory and delete all `node_modules` folders and their contents, without moving them to the Recycle Bin.

## Requirements
- Windows 10 or 11
- PowerShell

## Version
**1.0.0**

## Features

- Recursively searches for `node_modules` directories.
- Deletes the `node_modules` directories and their contents permanently (without moving them to the Recycle Bin).
- Displays progress in the console with color-coded messages:
    - **Green** for each directory found.
    - **Red** for each directory successfully removed.
- Takes a directory path as a parameter for flexibility.

## Prerequisites

- **PowerShell**: The script is written in PowerShell, so you need to have PowerShell installed on your system.
    - PowerShell comes pre-installed on Windows 10 and 11.

## Usage

1. Download or copy the script `remove_node_modules.ps1`.
2. Open **PowerShell** as an Administrator.
3. Run the script with the path to the directory where you want to remove `node_modules` folders.

### Command Example:

```powershell
.\remove_node_modules.ps1 -startDirectory "C:\path\to\your\projects"
```

- The script will start searching for node_modules directories inside the provided path and remove them.
- The process is logged in the console with green messages for found directories and red messages for removed ones.

## Parameters
-startDirectory: Specifies the path where the search should begin. This is the only required parameter. If no path is provided, a default path will be used.
### Example with a Specific Directory:
```powershell
.\remove_node_modules.ps1 -startDirectory "C:\path\to\your\projects"
```

I wish you a tasty coffee.

## License

MIT License

Copyright (c) [2023] FingerprintWeb.pl

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

Author: Wojciech Zdziejowski
