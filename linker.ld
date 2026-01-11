ENTRY(loader)
OUTPUT_FORMAT(elf32-i386)
OUTPUT_ARCH(i386:i386)

SECTIONS
{
	. = 0x0100000;

	.multiboot ALIGN(4) : {
		*(.multiboot)
	}

	.text :
	{
		*(.text)
		*(.rodata)
	}
	
	.data :
	{
		*(.data)
	}
	
	.bss :
	{
		*(.bss)
	}
	
}