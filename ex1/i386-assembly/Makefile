out ?= ./outputs/out

all: bootloader.bin

bootloader.bin: bootloader.o
	$(LD) -melf_i386 --oformat=binary -Ttext=0x7c00 $^ -o $@

bootloader.o: bootloader.s
	$(AS) --32 $< -o $@

run: bootloader.bin
	./qemu.sh $<

install: bootloader.bin
	mkdir -p $(out)
	cp $< $(out)

clean:
	rm -f *.bin *.o

.PHONY: clean run
