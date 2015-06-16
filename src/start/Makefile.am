all: crt0.o

.c.o:
	$(CC) $(CCASFLAGS) -flto $< -c -o $@

CLEANFILES = crt0.o
