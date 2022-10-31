    .section .text.entry
    .equ framesize, 256   # framesize = 32 * reg_size. In RV64, reg_size = 0x8
    .align 2
    .globl _traps 
_traps:
    # 1. save 32 registers and sepc to stack
    # Hint: x0 needn't to save
    # Note: x2 is sp!

    # stack space
    addi sp, sp, -framesize
    # save x1~x31
    sd x1, framesize-8(sp)
    sd x2, framesize-16(sp)
    sd x3, framesize-24(sp)
    sd x4, framesize-32(sp)
    sd x5, framesize-40(sp)
    sd x6, framesize-48(sp)
    sd x7, framesize-56(sp)
    sd x8, framesize-64(sp)
    sd x9, framesize-72(sp)
    sd x10, framesize-80(sp)
    sd x11, framesize-88(sp)
    sd x12, framesize-96(sp)
    sd x13, framesize-104(sp)
    sd x14, framesize-112(sp)
    sd x15, framesize-120(sp)
    sd x16, framesize-128(sp)
    sd x17, framesize-136(sp)
    sd x18, framesize-144(sp)
    sd x19, framesize-152(sp)
    sd x20, framesize-160(sp)
    sd x21, framesize-168(sp)
    sd x22, framesize-176(sp)
    sd x23, framesize-184(sp)
    sd x24, framesize-192(sp)
    sd x25, framesize-200(sp)
    sd x26, framesize-208(sp)
    sd x27, framesize-216(sp)
    sd x28, framesize-224(sp)
    sd x29, framesize-232(sp)
    sd x30, framesize-240(sp)
    sd x31, framesize-248(sp)

    # save sepc
    csrr t0, sepc
    sd t0, framesize-256(sp)

    # -----------

    # 2. call trap_handler
    csrr t0, scause
    mv a0, t0
    csrr t0, sepc
    mv a1, t0
    call trap_handler
    # -----------

    # 3. restore sepc and 32 registers (x2(sp) should be restore last) from stack
    ld t0, framesize-256(sp)
    csrw sepc, t0

    ld x1, framesize-8(sp)
    ld x3, framesize-24(sp)
    ld x4, framesize-32(sp)
    ld x5, framesize-40(sp)
    ld x6, framesize-48(sp)
    ld x7, framesize-56(sp)
    ld x8, framesize-64(sp)
    ld x9, framesize-72(sp)
    ld x10, framesize-80(sp)
    ld x11, framesize-88(sp)
    ld x12, framesize-96(sp)
    ld x13, framesize-104(sp)
    ld x14, framesize-112(sp)
    ld x15, framesize-120(sp)
    ld x16, framesize-128(sp)
    ld x17, framesize-136(sp)
    ld x18, framesize-144(sp)
    ld x19, framesize-152(sp)
    ld x20, framesize-160(sp)
    ld x21, framesize-168(sp)
    ld x22, framesize-176(sp)
    ld x23, framesize-184(sp)
    ld x24, framesize-192(sp)
    ld x25, framesize-200(sp)
    ld x26, framesize-208(sp)
    ld x27, framesize-216(sp)
    ld x28, framesize-224(sp)
    ld x29, framesize-232(sp)
    ld x30, framesize-240(sp)
    ld x31, framesize-248(sp)
    ld x2, framesize-16(sp)

    # -----------

        # 4. return from trap

    addi sp, sp, framesize
    sret
    # -----------

    .globl __dummy
__dummy:
    la t0, dummy
    csrw spec, t0
    sret

    .globl __switch_to
__switch_to:
    # save state to prev process
    # YOUR CODE HERE

    # restore state from next process
    # YOUR CODE HERE

    ret