main: xor-cipher.o strcmp.o
	ld -m elf_i386 strcmp.o xor-cipher.o -o xor-cipher

xor-cipher.o: xor-cipher.asm
	nasm -f elf32 xor-cipher.asm -o xor-cipher.o

strcmp.o: strcmp.asm
	nasm -f elf32 strcmp.asm -o strcmp.o

clean:
	rm xor-cipher
	rm *.o
