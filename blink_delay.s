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

      ldi r16, 0x0F  
      out DDRB, r16 

      ldi r16, 0x01 
      out PORTB, r16

      ; delay for 400ms
      
      ldi r21, 40

      call delay

      ldi r16, 0x00
      out PORTB, r16

      ; delay for 200ms

      ldi r21, 20

      call delay

      rjmp main

delay:
firstloop: 
        ldi r18, 157
secondloop:
        ldi r19, 255
thirdloop: 
        nop
        dec r19
        brne thirdloop
      dec r18
      brne secondloop
   dec r21
   brne firstloop
   ret 

mainloop: rjmp mainloop ; jump back to mainloop address 
