

void printf(char* str){

    unsigned short* VideoMemory = (unsigned short*)0xb8000;

    for(unsigned int i = 0; str[i] != '\0'; ++i){
        VideoMemory[i] = (VideoMemory[i] & 0xFF00) | str[i];
    }
}

extern "C" void kernelMain(void* multiboot_structure, unsigned int magic){

    printf("LeKernel           ");

    while(1);

}