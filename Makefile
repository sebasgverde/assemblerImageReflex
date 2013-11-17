
all: practicaOrg

INVOICECFLAGS=`pkg-config --cflags opencv`
INVOICECFLAGS += -g 
INVOICELIBS=`pkg-config --libs opencv`

practicaOrg: test.o practicaOrg.o
	$(CC) -g -nostartfiles -o $@ practicaOrg.o $< $(INVOICELIBS)

practicaOrg.o: practicaOrg.s
	nasm -f elf64 -l practicaOrg.lst practicaOrg.s

test.o: test.c
	echo "Hello"
	$(CC) $(INVOICECFLAGS) -c $< 

clean:
	rm  -f test.o test practicaOrg.lst practicaOrg.o


