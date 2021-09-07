SRC=songs poems fables oblique_strategies
DAT=$(SRC:=.dat)

.phony: clean toc

all: $(DAT)

%.dat: %
	strfile $< $@

clean:
	rm -f $(DAT)

toc:
	@perl -ne 'if ($$. == 1) {chomp; print} if ($$. == 2) {print " $$_"} next if /^$$/; if (/\%/) {$$v=1; next;}; if ($$v == 2) {print " $$_"; $$v=0} if ($$v == 1) {chomp; print; $$v++}' $(SRC) | sort | cat -n
