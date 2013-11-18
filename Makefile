
all: practicaOrg

FLAGS=`pkg-config --cflags opencv`
FLAGS += -g 
LIBS=`pkg-config --libs opencv`

practicaOrg: test.o practicaOrg.o
	$(CC) -g -nostartfiles -o $@ practicaOrg.o $< $(LIBS)

practicaOrg.o: practicaOrg.s
	nasm -f elf64 -l practicaOrg.lst practicaOrg.s

test.o: test.c
	echo "Hello"
	$(CC) $(FLAGS) -c $< 

clean:
	rm  -f test.o test practicaOrg.lst practicaOrg.o


