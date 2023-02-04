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

( \
	set -exu; \
	echo "debug Vagrantfile @ ${script_location}"; \
	cd "${script_location}"; \
	DEBUG= VAGRANT_LOG=info vagrant up || true; \
	echo "end of debug"; \
)