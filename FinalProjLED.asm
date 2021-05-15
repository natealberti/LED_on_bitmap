#author: nate alberti
#date: may 2021
# purpose: program which creates a LED light in the bitmap display
#and has functions to turn it on and off
.data
	.eqv    inputAddress 0xffff0000      # where the keyboard MMIO is located
	.eqv    keyPressed 0xffff0004      # where the input is stored
.text
main:
	# initializing the LED
	li $a0, 0x10040000
	li $a1, 0xffffff
	jal InitializeLED
  
	# getting input, 1 = ON; 2 = OFF; 3 = TOGGLE; d = LEFT; f = RIGHT; c = UP, e = DOWN
	loopInput:
		lw      $t0, inputAddress   # loading the address into $t0
		andi    $t0, $t0, 1   # anding the address with 1 to check if input is entered
		beq     $t0, $zero, loopInput   # if $t0 is 0, nothing has been pressed
		
	lb $t1, keyPressed   # if a key is pressed, load the code for that key into $t1
	
	#   CODES:
	#1: 49
	#2: 50
	#3: 51
	#d: 100
	#f: 102
	#c: 99
	#e: 101
	seq $s1, $t1, 49   # set $s1 if the code is 49 (turn ON)
	seq $s2, $t1, 50   # set $s2 if the code is 50 (turn OFF)
	seq $s3, $t1, 51   # set $s3 if the code is 51 (TOGGLE)
	seq $s4, $t1, 100   # set $s4 if the code is 100 (move LEFT)
	seq $s5, $t1, 102   # set $s5 if the code is 102 (move RIGHT)
	seq $s6, $t1, 99   # set $s6 if the code is 99 (move UP)
	seq $s7, $t1, 101   # set $s7 if the code is 101 (move DOWN)
	
	test1:
		beqz $s1, test2 # 1 was NOT pressed
		jal TurnOnLED # 1 was pressed, TURN ON
		b resetRegs
	
	test2:
		beqz $s2, test3 # 2 was NOT pressed
		jal TurnOffLED # 2 was pressed, turn OFF
		b resetRegs # reset the conditional registers for next loop
		
	test3:
		beqz $s3, test4 # 3 was NOT pressed
		jal ToggleLED # 3 must have been pressed, TOGGLE
		b resetRegs # reset the conditional registers for next loop
		
	test4:
		beqz $s4, test5 # 4 was NOT pressed
		li $a0, 0x10040000 # loading correct base address into every move left
		jal MoveLeftLED # 4 must have been pressed, move LEFT
		b resetRegs # reset the conditional registers for next loop
		
	test5:
		beqz $s5, test6 # 5 was NOT pressed
		li $a0, 0x10040000 # loading correct base address into every move right
		jal MoveRightLED # 5 must have been pressed, move RIGHT
		b resetRegs # reset the conditional registers for next loop
		
	test6:
		beqz $s6, test7 # 6 was NOT pressed
		li $a0, 0x10040000 # loading correct base address into every move up
		jal MoveUpLED # 6 must have been pressed, move UP
		b resetRegs # reset the conditional registers for next loop
		
	test7:
		li $a0, 0x10040000 # loading correct base address into every move down
		jal MoveDownLED # 7 must have been pressed, move DOWN
		b resetRegs # reset the conditional registers for next loop
		
	resetRegs:
		li $s1, 0
		li $s2, 0
		li $s3, 0
		li $s4, 0
		li $s5, 0
		li $s6, 0
		li $s7, 0
		b loopInput # loop back to get input again
    
    li $v0, 10
    syscall
    
    
.include "LED.asm"
	   
	
	
