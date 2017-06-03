// -*- mode: kasm -*-        

.import source "serial.h"

.macro incw(addr) {
        inc addr
        bne done
        inc addr+1
done:   
}
        
:BasicUpstart2(main)

main:   sei

open:   jsr serial.open
        
a:      ldx #$00
        lda #$00
        jsr map

b:      ldx #$00
        lda #$00
        jsr map

c:      ldx #$00
        lda #$00
        jsr map

d:      ldx #$00
        lda #$00
        jsr map
                
e:      lda #Command.set
        jsr serial.write

        lda #$00
        jsr serial.write
        
close:  jsr serial.close

copy: {
        ldx #$00
loop:   lda boot,x
        sta $0334,x
        inx
        cpx #boot.end-boot
        bne loop

        jmp $0334
}
        
.import source "serial.asm"	                
        
map: {  pha
        txa
        pha
        
        lda #Command.map
        jsr serial.write
        pla
        jsr serial.write
        pla
        jsr serial.write
        rts
}

boot: {
        lda #$35
        sta $01

        ldx #$00
loop:   lda $ffff,x
        sta $0801,x
        inx
        cpx #end-$0801
        bne loop

run:    ldx #$ff
        txs
        
        lda #$37
        sta $01
        cli        

        jsr $A533
 	jsr $A659
 	jmp $A7AE
end:            
}

.print toHexString(a-$0801+2)
.print toHexString(b-$0801+2)
.print toHexString(c-$0801+2)
.print toHexString(d-$0801+2)
.print toHexString(e-$0801+2)
.print "src = " + toHexString(boot.loop+1-$0801+2)        