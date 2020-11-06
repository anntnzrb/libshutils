# libshutils
# see license file for copyright and license details

PREFIX     := /usr/local
COLLECTION := ./collection
PARSER     := ./lib/doc_parser.sh

all: options

options:
	@printf "format -- runs linter + formatter\n"
	@printf "clean  -- cleans patch files\n"

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
	printf "%s\n" ${COLLECTION}/* | xargs -I{} -n1 ${PARSER} '{}'

.PHONY: all clean format options install docs
