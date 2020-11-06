# libshutils
# see license file for copyright and license details

all: options

options:
	@printf "format -- runs linter + formatter\n"
	@printf "clean  -- cleans patch files\n"

clean:
	${RM} *.diff *.orig *.rej

format:
	@printf '\nformatting files...\n'
	@-${SHELL} ./lib/formatter

.PHONY: all clean format options
