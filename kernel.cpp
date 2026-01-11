
void printf(char* str){

    unsigned short* VideoMemory = (unsigned short*)0xB8000;

    unsigned short colorAttrib = 0x0F00;

    for(unsigned int i = 0; str[i] != '\0'; ++i){
        VideoMemory[i] = colorAttrib | str[i];
    }
}

extern "C" void kernelMain(void* multiboot_structure, unsigned int magic){

    printf("LeKernel");

    while(1);

}