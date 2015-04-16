CC=gcc
CFLAGS=-Wall
LDFLAGS=-lpthread
EXEC=main

all: $(EXEC)

main: main.o producer.o
	$(CC) -o main producer.o main.o $(LDFLAGS) $(CFLAGS)

main.o: main.c mainHeader.h producer.o producerHeader.h
	$(CC) main.c producer.o -o main.o $(LDFLAGS) $(CFLAGS)

producer.o: producer.c producerHeader.h
	$(CC) -c producer.c -o producer.o $(CFLAGS) $(LDFLAGS)

clean:
	rm -rf *.o

mrproper: clean
	rm -rf $(EXEC)

