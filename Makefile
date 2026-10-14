BINDIR = /usr/local/bin
MANDIR = /usr/local/man/man1

PROG = msman
MAN  = msman.1

$(PROG): msman.sh
	cp msman.sh $(PROG)
	chmod +x $(PROG)

install: $(PROG)
	cp $(PROG) $(BINDIR)/$(PROG)
	mkdir -p $(MANDIR)
	cp $(MAN) $(MANDIR)/$(MAN)

remove:
	rm -f $(BINDIR)/$(PROG)
	rm -f $(MANDIR)/$(MAN)

.PHONY: install remove
