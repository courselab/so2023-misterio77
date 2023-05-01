out ?= ./outputs/out

all: bootloader.bin

bootloader.bin: bootloader.o
	$(LD) -melf_i386 --oformat=binary -Ttext=0x7c00 $^ -o $@

bootloader.o: bootloader.s
	$(AS) --32 $< -o $@

run: bootloader.bin
	qemu-system-i386 -nographic -drive format=raw,file=$< -net none

install: bootloader.bin
	mkdir -p $(out)
	cp $< $(out)

clean:
	rm -f *.bin *.o

.PHONY: clean run
