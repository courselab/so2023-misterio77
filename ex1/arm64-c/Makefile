out ?= ./outputs/out

all: kernel.elf

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
	./qemu.sh $<

install: kernel.elf kernel.img
	@mkdir -p $(out)
	cp $^ $(out)

clean:
	rm -f *.elf *.o *.img

.PHONY: all run clean install
