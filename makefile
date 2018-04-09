UTF=songs.utf8 poems.utf8
DAT=$(UTF:.utf8=.dat)
PLAIN=$(basename $(UTF))

.phony: clean toc

all: $(DAT) $(PLAIN)

%.iso: %.utf8
	iconv -f utf8 -t iso-8859-1 $< > $@

%.dat: %.iso
	strfile $< $@

%: %.iso
	cp $< $@

clean:
	rm -f $(DAT)

toc:
	@perl -ne 'if ($$. == 1) {chomp; print} if ($$. == 2) {print " $$_"} next if /^$$/; if (/\%/) {$$v=1; next;}; if ($$v == 2) {print " $$_"; $$v=0} if ($$v == 1) {chomp; print; $$v++}' $(UTF) | sort | cat -n
