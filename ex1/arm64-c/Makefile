out ?= ./outputs/out

all: kernel.elf

# Actual files

kernel.img: kernel.elf
	dd if=/dev/zero of=$@ bs=1024 count=1440
	dd if=$< of=$@ seek=0 conv=notrunc

kernel.elf: startup.o main.o
	$(LD) -T linker.ld $^ -o $@

startup.o: startup.s
	$(AS) $< -o $@

main.o: main.c
	$(CC) -c $< -o $@

# Phony rules

run: kernel.elf
	qemu-system-aarch64 -M virt -nographic -cpu cortex-a72 -kernel $<

install: kernel.elf kernel.img
	@mkdir -p $(out)
	cp $^ $(out)

clean:
	rm -f *.elf *.o *.img

.PHONY: all run clean install
