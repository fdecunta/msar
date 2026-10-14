# msar

Archives files into a date-based directory tree.

```
archive/
└── 2026/
    └── 10/
        └── 14/
            └── ms_v2.docx
```

## Usage

```
msar: [-a FILE] [-l]
  -a  archive FILE
  -l  list archived files
```


## Setup

Install with:

```sh
doas make install
```

`msar` expects a directory named `archive` in the current working directory.
Create it once:

```sh
mkdir archive
```

## Examples

```sh
# Archive a file (copied to archive/YYYY/MM/DD/ using today's date)
./msar.sh -a foo_etal_v4.pdf

# List everything in the archive, useful for pipes
./msar.sh -l
```

## Notes

- Files are **copied**, not moved; the original is left in place.
- If a file with the same name already exists for that day, you are asked
  before it is overwritten.
- Only regular files can be archived, not directories.
