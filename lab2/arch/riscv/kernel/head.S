.extern start_kernel

    .section .text.init    # 将 _start 放入.text.init section
    .globl _start
_start:
    # ------------------
    # - your code here -
    # ------------------

    # set stvec = _traps
    la t0, _traps
    csrw stvec, t0

    # set sie[STIE] = 1
    csrr t0, sie
    ori t1, t0, 0x00000020
    csrw sie, t1

    # set first time interrupt
    rdtime t0
    li t1, 10000000
    add a0, t0, t1  # d10000000 = h989680
    # mv a0, t0  # arg0
    and a1, a1, x0  #arg1
    and a2, a2, x0  #arg2
    and a3, a3, x0  #arg3
    and a4, a4, x0  #arg4
    and a5, a5, x0  #arg5
    mv a6, x0  # fid
    mv a7, x0  # ext
    ecall

    # set sstatus[SIE] = 1
    csrr t0, sstatus
    ori t1, t0, 0x00000002
    csrw sstatus, t1

    la sp, boot_stack_top
    jal start_kernel  # jump to start_kernel

    .section .bss.stack
    .globl boot_stack
boot_stack:
    .space 4096 # <-- change to your stack size

    .globl boot_stack_top
boot_stack_top: