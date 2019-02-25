/*	program: print to screen 
	author: nick hutter
	date: 1/30/19
	purpose: calculate the test average based on 3 user inputs 
	calculations: test average
	information: syscall to write to screen  */

.data
.balign 4	

prompt: .asciz "\nEnter Integer Then Press Enter:\n"
format: .asciz "%d"
num1: 	.int 0
num2:	.int 0
num3:	.int 0
output: .asciz "\nThe result is: %d\n"

.text
.global main
.extern printf
.extern scanf


main:

		push {ip, lr}


request1:	
		ldr r0, =prompt		@ assigns a asciz value to be printed	
		bl printf 			@ call C printf	

ScanF1: ldr r0, =format		@ r0 = format to obtain input (%d)
		ldr r1, =num1		@ r1 = address for result
		bl scanf			@ call C scanf
		ldr r1, =num1		@ r1 = address of result value
		ldr r4, [r1]		@ dereference r1 and store value in r4
		
request2:	
		ldr r0, =prompt		@ assigns a asciz value to be printed	
		bl printf 			@ call C printf	

ScanF2: ldr r0, =format		@ r0 = format to obtain input (%d)
		ldr r1, =num2		@ r1 = address for result
		bl scanf			@ call C scanf
		ldr r1, =num2		@ r1 = address of result value
		ldr r5, [r1]		@ dereference r1 and store value in r5
		
request3:	
		ldr r0, =prompt		@ assigns a asciz value to be printed
		bl printf 			@ call C printf	

ScanF3: ldr r0, =format		@ r0 = format to obtain input (%d)
		ldr r1, =num3		@ r1 = address for result
		bl scanf			@ call C scanf
		ldr r1, =num3		@ r1 = address of result value
		ldr r6, [r1]		@ dereference r1 and store value in r6

@sumthreenumbers
	
	ADD R7, R5, R6 			@ r7 = r6 + r5
	ADD R7, R4, R7 			@ r7 = r7 + r4
	
@subtract
	MOV     R1, R7  		@ move r7 to r1
	MOV     R2,#3     		@ prepare to divide r1 by r2
	MOV     R5,#0     		@ initialise counter
subtract:
	SUBS    R1,R1,R2  		@ subtract r2 from r1 and sotre result back in r1, setting flags
						
	ADD     R5,R5,#1  		@ add 1 to counter not adding to flags
	BHI     subtract  		@ branch to start of loop on condition higher, r1 is greater than r2

		
@display final result
		mov r1, r5
		ldr r0, =output		@ASSIGNS A ASCIZ VALUE TO BE PRINTED	
		bl printf 			@CALLS FUNCITON
	
		
		pop {ip, pc} 		@RETURNS PROGRAM 
	


   
	
	
