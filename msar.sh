#!/bin/sh

PROG="msar"
ARCHIVE="archive"

usage() {
	echo "${PROG}: [-a FILE] [-l]" >&2
	echo "  -a  archive FILE" >&2
	echo "  -l  list archived files" >&2
}

warn() {
	echo "${PROG}:" "$@" >&2
}

assert_archive() {
	if [ ! -d "${ARCHIVE}" ]; then
		warn "missing directory: ${ARCHIVE}/"
		exit 1
	fi
}

add_file() {
	file="$1"

	assert_archive

	if [ ! -f "${file}" ]; then
		warn "${file}: No such file"
		exit 1
	fi

	dir="${ARCHIVE}/$(date +%Y/%m/%d)"

	mkdir -p "${dir}" || exit 1

	cp -iv -- "${file}" "${dir}" || exit 1
}

list_archive() {
	assert_archive
	find "${ARCHIVE}" -mindepth 4 | sort
}

if [ $# -eq 0 ]; then
	usage
	exit 1
fi

while getopts a:lh arg
do
	case ${arg} in
	a) add_file "${OPTARG}" ;;
	l) list_archive ;;
	h) usage ;;
	*) usage; exit 2 ;;
	esac
done
shift $((OPTIND - 1))

if [ $# -gt 0 ]; then
	warn "unexpected argument: $1" 
	exit 2
fi
