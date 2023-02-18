main.hex: main.o
	avr-objcopy -j .text -j .data -O ihex main.o main.hex
main.o: main.c
	avr-gcc -Wall -Os -DF_CPU=1048576 -mmcu=attiny85 -o main.o main.c
flash: main.hex
	avrdude -c usbtiny -p t85 -U flash:w:main.hex:a
dump_program:
	avrdude -c usbtiny -p t85 -U flash:r:dump.hex:r

clean:
	rm -rf *.o *.hex
