.section ".text.boot"

.global _start

_start:
    ldr x30, =stack_top     /* initial stack address */
    mov sp, x30             /* set stack address     */
    bl main                 /* branch to main()      */
    ldr x0, =0x84000008     /* SYSTEM_OFF            */
    hvc #0                  /* hypervisor call       */
