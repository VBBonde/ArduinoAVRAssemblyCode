; led_on.s : switches on the arduino LED

; specify equivalent symbols
.equ SREG ,0x3f ;Status register, address 0x3f. Data sheet p.11
.equ PORTB, 0x05 ; Label for the PORTB address
.equ DDRB, 0x04 ; Label for the DDRB address

; specify the start address
.org 0
; reset system status
main: ldi r16, 0 ; set register r16 to zero
      out SREG, r16 ; copy contents of r16 to SREG, i.e. , clear SREG
      ldi r16, 0x0F ; set the value of r16 to hex value 0x0F
      out DDRB, r16 ; copy contents of r16 to DDRB
      ldi r16, 0x01 ; set the value of r16 to the hex value 0x01
      out PORTB, r16 ; copy the contents of r16 to PORTB


mainloop: rjmp mainloop ; jump back to mainloop address 
