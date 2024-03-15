/*
 * (C) 2018 Alexander Graf <agraf@suse.de>
 *
 * SPDX-License-Identifier:	GPL-2.0+
 */
#define STORE_IDX(reg, idx) sd reg, (idx*8)(a0)
#define LOAD_IDX(reg, idx)  ld reg, (idx*8)(a0)
/*
#ifdef CONFIG_CPU_RISCV_64

#else
#define STORE_IDX(reg, idx)	sw reg, (idx*4)(a0)
#define LOAD_IDX(reg, idx)	lw reg, (idx*4)(a0)
#endif
*/
/* #include <kernel_structs.h> */

/* exports */
/*
GTEXT(setjmp)
GTEXT(longjmp)
*/
.globl setjmp
.globl longjmp

.section .text
setjmp:
	/* Preserve all callee-saved registers and the SP */
	STORE_IDX(s0, 0)
	STORE_IDX(s1, 1)
	STORE_IDX(s2, 2)
	STORE_IDX(s3, 3)
	STORE_IDX(s4, 4)
	STORE_IDX(s5, 5)
	STORE_IDX(s6, 6)
	STORE_IDX(s7, 7)
	STORE_IDX(s8, 8)
	STORE_IDX(s9, 9)
	STORE_IDX(s10, 10)
	STORE_IDX(s11, 11)
	STORE_IDX(ra, 12)
	STORE_IDX(sp, 13)
	li  a0, 0
	ret

longjmp:
	LOAD_IDX(s0, 0)
	LOAD_IDX(s1, 1)
	LOAD_IDX(s2, 2)
	LOAD_IDX(s3, 3)
	LOAD_IDX(s4, 4)
	LOAD_IDX(s5, 5)
	LOAD_IDX(s6, 6)
	LOAD_IDX(s7, 7)
	LOAD_IDX(s8, 8)
	LOAD_IDX(s9, 9)
	LOAD_IDX(s10, 10)
	LOAD_IDX(s11, 11)
	LOAD_IDX(ra, 12)
	LOAD_IDX(sp, 13)

	/* Move the return value in place, but return 1 if passed 0. */
	beq a1, zero, longjmp_1
	mv a0, a1
	ret

	longjmp_1:
	li a0, 1
	ret


; .text
;  /*
;          * save the old thread's registers,
;          * restore the new thread's registers.
;          */

; .globl thread_switch
;  // a0 是老的上下文，a1 是新的
; thread_switch:
;  /* YOUR CODE HERE */
; 	sd ra, 0(a0)
; 	sd sp, 8(a0)
; 	sd s0, 16(a0)
; 	sd s1, 24(a0)
; 	sd s2, 32(a0)
; 	sd s3, 40(a0)
; 	sd s4, 48(a0)
; 	sd s5, 56(a0)
; 	sd s6, 64(a0)
; 	sd s7, 72(a0)
; 	sd s8, 80(a0)
; 	sd s9, 88(a0)
; 	sd s10, 96(a0)
; 	sd s11, 104(a0)

; 	ld ra, 0(a1)
; 	ld sp, 8(a1)
; 	ld s0, 16(a1)
; 	ld s1, 24(a1)
; 	ld s2, 32(a1)
; 	ld s3, 40(a1)
; 	ld s4, 48(a1)
; 	ld s5, 56(a1)
; 	ld s6, 64(a1)
; 	ld s7, 72(a1)
; 	ld s8, 80(a1)
; 	ld s9, 88(a1)
; 	ld s10, 96(a1)
; 	ld s11, 104(a1)

; 	ret    /* return to ra */