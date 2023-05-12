# File Extension Converter

This script converts the file extensions of files in a specified directory or the current directory if no target is provided. It supports specifying the current and new file extensions, as well as the target directory.

## Table of Contents
- [Features](#features)
- [Usage](#usage)
    - [Prerequisites](#prerequisites)
    - [Examples](#examples)
    - [License](#license)

## Features

1. Convert file extensions in a specified directory or the current directory.
2. Specify the current file extension and the new file extension.
3. Optionally specify the target directory with `--target` argument.
4. Script scans all files, including nested folders and files.

## Usage

### Prerequisites

To make the `save.sh` script executable on your computer, you need to set the executable permission for the file. You can do this using the `chmod` command. Here's how:

```sh
chmod +x convert.sh
```

## Examples

#### Example 1: Convert all .vue files to .ts files in the src/template directory

This command will run the script, converting all .vue files to .ts files in the specified src/template directory.

```sh
test@computer % ./convert.sh --current_ext vue --new_ext ts --target src/template 
```

<br /> 

#### Convert all .ts files to .vue files in the current directory

This command will run the script, converting all .ts files to .vue files in the current directory.


```sh
test@computer % ./convert.sh --current_ext ts --new_ext vue
```

<br /> 

## License
[![License](https://img.shields.io/badge/LICENSE-GPL--3.0-orange)](https://github.com/mustafadalga/file-extension-converter/blob/main/LICENSE)




