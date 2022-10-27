#include "print.h"
#include "sbi.h"
#include "defs.h"

extern void test();

int start_kernel() {
    puti(-2022);
    puts(" Hello RISC-V\n");
    puti(csr_read(sstatus));
    csr_write(sscratch, 0x1);
    puts("\n");
    puti(csr_read(sscratch));
    puts("\n");
    test(); // DO NOT DELETE !!!

	return 0;
}
