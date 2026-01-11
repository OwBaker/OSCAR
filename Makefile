
GPPPARAMS = -m32 -fno-use-cxa-atexit -nostdlib -fno-builtin -fno-rtti -fno-exceptions -fno-leading-underscore
ASPARAMS = --32
LDPARAMS = -melf_i386

system = kernel.o loader.o

%.o: %.cpp
	g++ $(GPPPARAMS) -c $< -o $@

%.o: %.s
	as $(ASPARAMS) $< -o $@

kernel.bin: linker.ld $(system)
	ld $(LDPARAMS) -T $< -o $@ $(system)

OSCAR.iso: kernel.bin
	mkdir -p iso/boot/grub
	cp $< iso/boot
	cp grub.cfg iso/boot/grub
	grub-mkrescue /usr/lib/grub/i386-pc -o $@ iso/

run: OSCAR.iso
	qemu-system-i386 -cdrom OSCAR.iso