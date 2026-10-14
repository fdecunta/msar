BINDIR = /usr/local/bin
MANDIR = /usr/local/man/man1

PROG = msar
MAN  = msar.1

$(PROG): msar.sh
	cp msar.sh $(PROG)
	chmod +x $(PROG)

install: $(PROG)
	cp $(PROG) $(BINDIR)/$(PROG)
	mkdir -p $(MANDIR)
	cp $(MAN) $(MANDIR)/$(MAN)

remove:
	rm -f $(BINDIR)/$(PROG)
	rm -f $(MANDIR)/$(MAN)

.PHONY: install remove
