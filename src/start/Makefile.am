all: crt0.o

.c.o:
	$(CC) $(CCASFLAGS) -flto $< -c -o $@

install-exec-hook: crt0.o
	$(mkinstalldirs) $(libdir)
	$(INSTALL_DATA) crt0.o $(libdir)/crt0.o

uninstall-hook:
	rm -f $(libdir)/crt0.o

CLEANFILES = crt0.o
