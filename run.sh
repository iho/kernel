aarch64-none-elf-as boot.s -o boot.o
aarch64-none-elf-gcc -ffreestanding -c kernel.c -o kernel.o
aarch64-none-elf-ld -nostdlib -Tlinker.ld boot.o kernel.o -o kernel.elf
aarch64-none-elf-objcopy -O binary kernel.elf kernel.img
qemu-system-aarch64 -accel hvf -machine virt   -cpu cortex-a57 -kernel kernel.elf -nographic