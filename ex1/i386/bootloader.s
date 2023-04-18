## Boot, say hello, and halt (AT&T assembly)

.code16
.global _start

_start:
    movb $0xe, %ah
    movw $0x0, %bx
loop:
    movb msg(%bx), %al # Offset to each character in the message
    cmp  $0x0, %al     # Loop while char is not 0x0 (end of string)
    je   halt          # Jump to halt if last cmp was true
    int  $0x10         # Call BIOS video service
    add  $0x1, %bx     # Point to the next character
    jmp  loop          # Repeat until we find a character 0x0

halt:
    hlt      # Halt
    jmp halt # Safeguard

msg:
    .string "Hello World"          # C-like NULL terminated string
    .fill 510 - (. - _start), 1, 0 # Pad with zeros
    .word 0xaa55                   # Boot signature
