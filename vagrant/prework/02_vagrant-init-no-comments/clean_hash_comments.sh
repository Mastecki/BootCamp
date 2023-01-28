#!/bin/sh
set -exu;

# for explanation of script_location variable,
# see: https://stackoverflow.com/a/29835459
# and  https://stackoverflow.com/a/246128
# this is more a guarantee this script will work
# no matter where you run it
# not something for you to learn now
script_location=$( \
	CDPATH= \
	cd \
		-- \
		"$(dirname -- "$0")" \
	&& pwd \
		-P \
);

# let's clear default Vagrantfile from vagrant init
cat "${script_location}/../01_vagrant-init/Vagrantfile" \
| sed \
	-e '/^[[:space:]]*#.*$/d' \
	-e '/^[[:space:]]*$/d' \
| tee \
	"${script_location}/Vagrantfile" \
;
# tee is combination of echo to stdout and to a file
#   https://man7.org/linux/man-pages/man1/tee.1.html
#
# sed is line editor
#   https://man7.org/linux/man-pages/man1/sed.1.html
# sed -e 'foo' -e 'bar' means
#   "execute regular expression 'foo' and then 'bar'"
# in sed, '/pattern/d' means
#   "if line matches pattern, delete line"
# in regexp: 
#   ^ is start od line
#   $ is end of line
#   . is any character ("real" period is \.)
#   * is "previous character is repeatead >= 0 times"
#   [xy0z] is "1 character of any of x, y, 0 or z"
#   [:space:] is a group with all whitespaces
#
# so this sed in this script is:
#   1)delete all lines starting with any number of
#     whitespaces, followed immediately by '#'
#   2)delete all lines that are either empty,
#     or contain only whitespaces
