#!/bin/bash
# copyright 2008 Junichi Uekawa <dancer@debian.org>
# licensed under GPLv2 or later, see the file ../COPYING for details.

# make sure wrong logfile specification gives a reasonable error
# message

WORKTARGET=$(mktemp -d)
if [[ $( ./lsyncd --logfile /nonexisting/path/name . "${WORKTARGET}" ) =~ "cannot open logfile" ]]; then
    rmdir "${WORKTARGET}"
    exit 0;
else
    exit 1;
fi