#
# Created by Takahashi En
#

CC = x86_64-elf-gcc
AS = x86_64-elf-as
OBJCPOY = x86_64-elf-objcopy
OBJDUMP = x86_64-elf-objdump
LD = x86_64-elf-ld

CC_FLAGS = -static -mcmodel=large -fno-builtin -m64 -fno-stack-protector
OBJCPOY_FLAGS = -I elf64-x86-64 -S -R ".eh_frame" -R ".comment"
LD_FLAGS = -b elf64-x86-64 -z muldefs -T Kernel.lds

all: system.o
	$(OBJCPOY) $(OBJCPOY_FLAGS) -O binary system.o kernel.bin
	cp kernel.bin ../

system.o: head.o entry.o main.o printk.o trap.o memory.o interrupt.o task.o
	$(LD) $(LD_FLAGS) head.o entry.o main.o printk.o trap.o memory.o interrupt.o task.o -o system.o
	$(OBJDUMP) -D system.o > system.d

head.o:	head.S
	$(CC) -E  head.S > head.e
	$(AS) --64 -o head.o head.e
	$(OBJDUMP) -D head.o > head.d

entry.o: entry.S
	$(CC) -E  entry.S > entry.e
	$(AS) --64 -o entry.o entry.e
	$(OBJDUMP) -D entry.o > entry.d
	
main.o:	main.c lib.h
	$(CC) $(CC_FLAGS) -c main.c
	$(OBJDUMP) -D main.o > main.d
	
printk.o: printk.c lib.h
	$(CC) $(CC_FLAGS) -c printk.c
	$(OBJDUMP) -D printk.o > printk.d

trap.o: trap.c
	$(CC) $(CC_FLAGS) -c trap.c
	$(OBJDUMP) -D trap.o > trap.d

memory.o: memory.c
	$(CC) $(CC_FLAGS) -c memory.c
	$(OBJDUMP) -D memory.o > memory.d

interrupt.o: interrupt.c
	$(CC) $(CC_FLAGS) -c interrupt.c
	$(OBJDUMP) -D interrupt.o > interrupt.d

task.o: task.c
	$(CC) $(CC_FLAGS) -c task.c
	$(OBJDUMP) -D task.o > task.d

clean:
	rm -rf *.o *.d *.s~ *.e *.S~ *.c~ *.h~ Makefile~ Kernel.lds~ kernel.bin
