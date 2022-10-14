

 // Section .crt0 is always placed from address 0
	.section .crt0, "ax"

_start:
	.global _start

 /*
 	Assembly Abstraction assignment
 	Note:
 	  - As a minimum, you should plan to allocate registers for the following to
 	    to implement the routine

 	    - maximum count of loop which will be initialized to your first initial, lowercase
	         - you can tell the assembler to evaluate your initial by specifying a
		 character
		 - example:  addi  x10, x0, 'k'
 	    - count variable, i, that will go from 0 to maximum count
 	    	- or, the count variable could be assigned max value and count to 0
 	    - result variable which is initialized to 0
 	    - memory address to store result initialized to 0x2000


 	    hint:  you can use the RISCV add immediate instruction, addi, to initialize
 	        a register

 	Start here
 */

// Plan (Declare) by making a comment for each register that you will be using and its purpose
// These comments will be helpful to refer back to determine which register to use

// x10 set to 0x555
// x11 set to 0x333
// x15 contains the address to memory location 0x1f70 (0b0001 1111 0111 0000)
// x16 contains the address to the label DATA:

// Initialize all of your registers.  Immediate instructions are recommended where possible

    addi x10, x0, 0x55
    addi x11, x0, 0x33

// initializing x15 with 0x1f70
    lui x15, 0x1f70
    srli x15, x15, 12

// initializing x16 with address with label DATA:
    lui x16, (DATA & 0xfff)     // obtain lower 12-bits of address which will start at bit 12
    srli x16, x16, 12           // shift the lower 12-bits to the proper bit positions
    lui x30, ((DATA & 0xfffff000) >> 12)    // Immediate the upper 20-bits into their proper location
    or  x16, x16, x30           // combine the upper 20-bits with the lower 12-bits (Initialized)



// Implement your for loop



// Store into memory the result(s)

    sw x10, 4(x15)              // store 0x555 at address location 0x1f70 + 4 (0x1f74)
    sw x11, -4(x16)             // store 0x333 at address locaton DATA - 4


 /*
 	Add your assembly code above this line
 */
	nop
	nop
	nop
	halt	// end of simulation
	nop
	nop
	nop
    nop
DATA:
    nop
    nop
    nop
    nop

