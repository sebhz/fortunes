IN=songs poems
DAT=$(IN:=.dat)

.phony: clean toc

all: $(DAT)

%.dat: %
	strfile $< $@

clean:
	rm $(DAT)

toc: $(IN)
	@perl -ne 'if ($$. == 1) {chomp; print} if ($$. == 2) {print " $$_"} next if /^$$/; if (/\%/) {$$v=1; next;}; if ($$v == 2) {print " $$_"; $$v=0} if ($$v == 1) {chomp; print; $$v++}' $(IN) | sort | cat -n
