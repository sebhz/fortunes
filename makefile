songbook.dat: songbook
	strfile $< $@

clean:
	rm songbook.dat

