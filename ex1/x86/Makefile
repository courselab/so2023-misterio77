# Makefile - Main build script
out ?= ./outputs/out

bootloader.bin: bootloader.o
	$(LD) -melf_i386 --oformat=binary -Ttext=0x7c00 $^ -o $@

bootloader.o: bootloader.s
	$(AS) --32 $< -o $@

.PHONY: clean run

install: bootloader.bin
	mkdir -p $(out)
	cp $< $(out)

run: bootloader.bin
	qemu-system-i386 -nographic -drive format=raw,file=$< -net none

clean:
	rm -f *.bin *.o
