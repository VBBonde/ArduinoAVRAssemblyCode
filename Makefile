DEV=/dev/ttyUSB0

%.hex: clean
	@echo Making $@
	avr-as -g -mmcu=atmega328p -o $*.o $*.s 
	avr-ld -o $*.elf $*.o
	avr-objcopy -O ihex -R .eeprom $*.elf $@
	# avrdude
	avrdude -C /etc/avrdude.conf -p atmega328p -c arduino -P $(DEV) -D -U flash:w:$*.hex:i

clean:
	-rm *.hex
	-rm *.o
	-rm *.elf
