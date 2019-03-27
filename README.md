# FileWhich 
### Luca Santarella - Prof. Kirtman

## Files Included
 * `filewhich.sh`
 * `filewhich2.sh`


### `filewhich.sh`

This program uses glob expansion to check if a supplied file exists in the set of directories supplied by a colon separated list in either the arugment `-p` or the bash variable `$FILEPATH`.

#### Usage
`Usage: filewhich [-a] [-p /path/to/files:/path/to/more/files] file_name`

##### Arguments
| Arg | Description | Required | Parameters |
| --- | --- | --- | --- |
| `-a` | Show all - Shows all files that match the supplied file name. | NO | NONE |
| `-p` | File Paths - Search this colon separated list of paths for the supplied filename. Alternatively, the shell vairable `$FILEPATH` will be referenced. If neither are available, the program will exit with an error. | NO | A colon separated list of paths. Ex. `/path/to/files:/path/to/more/files` |


### `filewhich2.sh`

This program uses `test`'s ( `[` ) `-e` option to check if a supplied file exists in the set of directories supplied by a colon separated list in either the arugment `-p` or the bash variable `$FILEPATH`.

#### Usage
`Usage: filewhich [-a] [-p /path/to/files:/path/to/more/files] file_name`

##### Arguments
| Arg | Description | Required | Parameters |
| --- | --- | --- | --- |
| `-a` | Show all - Shows all files that match the supplied file name. | NO | NONE |
| `-p` | File Paths - Search this colon separated list of paths for the supplied filename. Alternatively, the shell vairable `$FILEPATH` will be referenced. If neither are available, the program will exit with an error. | NO | A colon separated list of paths. Ex. `/path/to/files:/path/to/more/files` |