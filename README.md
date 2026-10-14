# msman

A tiny shell script that archives files into a date-based directory tree.

```
archive/
└── 2026/
    └── 10/
        └── 14/
            └── notes.txt
```

## Usage

```
msman [-a FILE] [-l] [-h]
```

| Option    | Description                 |
|-----------|-----------------------------|
| `-a FILE` | Archive `FILE`              |
| `-l`      | List archived files         |
| `-h`      | Show usage                  |

## Setup

`msman` expects a directory named `archive` in the current working directory.
Create it once:

```sh
mkdir archive
```

## Examples

```sh
# Archive a file (copied to archive/YYYY/MM/DD/ using today's date)
./msman.sh -a report.pdf

# List everything in the archive
./msman.sh -l
```

## Notes

- Files are **copied**, not moved; the original is left in place.
- If a file with the same name already exists for that day, you are asked
  before it is overwritten.
- Only regular files can be archived, not directories.
- Requires only a POSIX `sh` and standard utilities (`cp`, `find`, `sort`, `date`, `mkdir`).
# msman
