SONGBOOK=songbook
DAT=$(SONGBOOK).dat

.phony: clean toc

$(DAT): $(SONGBOOK)
	strfile $< $@

clean:
	rm $(DAT)

toc:
	@perl -ne 'if ($$. == 1) {chomp; print} if ($$. == 2) {print " $$_"} next if /^$$/; if (/\%/) {$$v=1; next;}; if ($$v == 2) {print " $$_"; $$v=0} if ($$v == 1) {chomp; print; $$v++}' $(SONGBOOK) | sort | cat -n
