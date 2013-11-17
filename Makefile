
all: test

INVOICECFLAGS=`pkg-config --cflags opencv`
INVOICECFLAGS += -g 
INVOICELIBS=`pkg-config --libs opencv`

test: test.o
	$(CC) -g -o $@ $< $(INVOICELIBS)


test.o: test.c
	echo "Hello"
	$(CC) $(INVOICECFLAGS) -c $< 

clean:
	rm  -f test.o test


