all: crt0.o

.S.o:
	$(CC) $(CCASFLAGS) $< -c -o $@

crt0.S: crt0.c
	$(CC) $(CCASFLAGS) $< -S -o $@

clean:
	-rm -f crt0.S crt0.o
