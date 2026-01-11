.set MAGIC, 0x1BADB002                         # up here, we set the magic number and the flags required for GRUB
.set FLAGS, (1<<0 | 1<<1)                      # load all boot modules on page boundaries, and request memory
.set CHECKSUM, -(MAGIC + FLAGS)

.section .multiboot
    .long MAGIC
    .long FLAGS
    .long CHECKSUM

.section .text
.extern kernelMain                              # denote external function
.global loader                                  # declare loader as global

loader:
    mov $kernel_stack, %esp                     # set stack pointer
    push %eax
    push %ebx
    call kernelMain                             # call the kernel

_stop:
    cli                                         # disable interrupts
    hlt                                         # halt cpu
    jmp _stop                                   # recurse

.section .bss
.space 2*1024*1024                              # reserve 2mb space
kernel_stack:                                   # assign to label
