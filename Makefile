# libshutils
# see license file for copyright and license details

include config.mk

all: options

options:
	@printf "format -- runs linter + formatter\n"
	@printf "clean  -- cleans patch files\n"
	@printf "docs   -- generate html documentation for scripts\n"

clean:
	${RM} *.diff *.orig *.rej

format:
	@printf '\nformatting files...\n'
	@-${SHELL} ./lib/formatter

install:
	mkdir -p ${PREFIX}/bin
	chmod 755 ${COLLECTION}/*
	cp ${COLLECTION}/* ${PREFIX}/bin

docs:
	@-printf "%s\n" ${COLLECTION}/* | xargs -I{} -n1 ${PARSER} '{}'

.PHONY: all clean format options install docs
