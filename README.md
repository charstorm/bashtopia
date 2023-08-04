# bashtopia
*Generic bash utility scripts*

This project is a collection of useful scripts, tools, aliases, and settings
that I made to simplify my bashrc. The main script `main.sh` has most of the
settings and it runs other scripts from the src folder.

The project has two main features besides settings and aliases.

- PATH variable handling based on a file
- Location bookmarks

## Installation
Installation is simple. Clone the repo and source the top level script `main.sh`
from bashrc.

```
source /path/to/bashtopia/main.sh
```

Once installed, the script will update the prompt (PS1) to something like:

```
[ID] hh:mm:ss | user@system | /current/location/
==>
```

The `[ID]` here is a unique ID given to every active shell based on its tty-ID.
Use of this will be explained later when discussing numeric bookmarks.

## PATH management
This feature is handled by `src/add_paths_from_file.sh`.

Add locations to the file `~/.paths.txt` to add them to `PATH`.
Each line should be a path to a directory. Here is an example:

```
~/.local/bin
/usr/sbin
```

## Bookmarks
This feature is handled by `src/bookmark_utils.sh`. It provides the following
commands.

|Command|Alias|Example|Explanation|
|-------|-----|-------|-----------|
|bookmark_add|gg|`gg name`|Add CWD to bookmarks with the given `name`|
|bookmark_cd|hh|`hh name`|CD to bookmark with the given `name`|
|bookmark_search|pp|`pp pattern`|Search for bookmarks with `pattern`|

The aliases are defined in `main.sh`. It may be wise to rename them to something
you like.

Numeric bookmarks are automatically added for every shell based on their
shell-ID. Therefore it is possible to jump to the location of a shell from
another using `hh`. For example, to jump to the location of shell with ID 3 from
another shell, we can use `hh 3`.

## License

```
Copyright 2023- Vinay Krishnan

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

Unless otherwise mentioned, above license is applicable on all files in this
repository.
