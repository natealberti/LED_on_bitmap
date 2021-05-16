#author: nate alberti
#date: may 2021
# purpose: program which creates a LED light in the bitmap display
#and has functions to turn it on and off

### INITIALIZE LED SUBPROGRAM ###
# arguents: $a0 has the base address; $a1 has the state of on or off (as a binary 1 or 0)
.data
	ADDRESS: .word 0
	ONCOLOR: .word 0xfff400
	OFFCOLOR: .word 0xffffff
	GRAY: .word 0xcecece
.text
InitializeLED:
	# prologue
	addi $sp, $sp, -8 # making room for 2 items on stack pointer
	sw $ra, 4($sp) # pushing $ra
	sw $s0, 0($sp) # pushing $s0
	
	move $s0, $a0 # moving the base address into $s0
	move $t0, $a1 # moving the color to $t0
	
	sw $s0, ADDRESS
	
	# DRAWING THE LED #
	sw $t0, 1140($s0) # loading the color white onto the memory
	# left side
	sw $t0, 1388($s0)
	sw $t0, 1636($s0)
	sw $t0, 1888($s0)
	sw $t0, 2140($s0)
	sw $t0, 2392($s0)
	sw $t0, 2648($s0)
	sw $t0, 2904($s0)
	sw $t0, 3160($s0)
	sw $t0, 3416($s0)
	sw $t0, 3672($s0)
	sw $t0, 3928($s0)
	sw $t0, 4184($s0)
	sw $t0, 4440($s0)
	sw $t0, 4696($s0)
	sw $t0, 4952($s0)
	
	# bottom
	sw $t0, 4956($s0)
	sw $t0, 4960($s0)
	sw $t0, 4964($s0)
	sw $t0, 4968($s0)
	sw $t0, 4972($s0)
	sw $t0, 4976($s0)
	sw $t0, 4980($s0)
	sw $t0, 4984($s0)
	sw $t0, 4988($s0)
	sw $t0, 4992($s0)
	sw $t0, 4996($s0)
	sw $t0, 5000($s0)
	
	# right side
	sw $t0, 1404($s0)
	sw $t0, 1664($s0)
	sw $t0, 1924($s0)
	sw $t0, 2184($s0)
	sw $t0, 2444($s0)
	sw $t0, 2700($s0)
	sw $t0, 2956($s0)
	sw $t0, 3212($s0)
	sw $t0, 3468($s0)
	sw $t0, 3724($s0)
	sw $t0, 3980($s0)
	sw $t0, 4236($s0)
	sw $t0, 4492($s0)
	sw $t0, 4748($s0)
	sw $t0, 5004($s0)
	
	
	lw $t0, GRAY # loading gray into the color slot
	
	# HOLDER #
	sw $t0, 5228($s0) # loading the color gray onto the memory
	sw $t0, 5484($s0) # loading the color gray onto the memory
	sw $t0, 5740($s0) # loading the color gray onto the memory
	sw $t0, 5996($s0) # loading the color gray onto the memory
	sw $t0, 6252($s0) # loading the color gray onto the memory
	sw $t0, 6508($s0) # loading the color gray onto the memory
	sw $t0, 6764($s0) # loading the color gray onto the memory
	sw $t0, 7020($s0) # loading the color gray onto the memory
	sw $t0, 7276($s0) # loading the color gray onto the memory
	sw $t0, 7532($s0) # loading the color gray onto the memory
	sw $t0, 7788($s0) # loading the color gray onto the memory
	# holder right side
	sw $t0, 5240($s0) # loading the color gray onto the memory
	sw $t0, 5496($s0) # loading the color gray onto the memory
	sw $t0, 5752($s0) # loading the color gray onto the memory
	sw $t0, 6008($s0) # loading the color gray onto the memory
	sw $t0, 6264($s0) # loading the color gray onto the memory
	sw $t0, 6520($s0) # loading the color gray onto the memory
	sw $t0, 6776($s0) # loading the color gray onto the memory
	sw $t0, 7032($s0) # loading the color gray onto the memory
	sw $t0, 7288($s0) # loading the color gray onto the memory
	sw $t0, 7544($s0) # loading the color gray onto the memory
	sw $t0, 7800($s0) # loading the color gray onto the memory
	
	
	# epilogue
	lw $s0, 0($sp) # popping $t0
	lw $ra, 4($sp) # popping $s0
	addi $sp, $sp 4 # returning stack pointer to normal length
	
	# returning control to main
	jr $ra

#### TURN ON SUBPROGRAM ###
TurnOnLED:
	# prologue
	addi $sp, $sp, -8 # making room for x items on stack pointer
	sw $ra, 4($sp) # pushing $ra
	sw $s0, 0($sp) # pushing $s0
	
	lw $s0, ADDRESS # saving base address in $s0
	lw $t0, ONCOLOR # $t0 has the proper color in it
	
	# DRAWING THE LED #
	sw $t0, 1140($s0) # loading the color white onto the memory
	# DRAWING THE LED #
	sw $t0, 1140($s0) # loading the color white onto the memory
	# left side
	sw $t0, 1388($s0)
	sw $t0, 1636($s0)
	sw $t0, 1888($s0)
	sw $t0, 2140($s0)
	sw $t0, 2392($s0)
	sw $t0, 2648($s0)
	sw $t0, 2904($s0)
	sw $t0, 3160($s0)
	sw $t0, 3416($s0)
	sw $t0, 3672($s0)
	sw $t0, 3928($s0)
	sw $t0, 4184($s0)
	sw $t0, 4440($s0)
	sw $t0, 4696($s0)
	sw $t0, 4952($s0)
	
	# bottom
	sw $t0, 4956($s0)
	sw $t0, 4960($s0)
	sw $t0, 4964($s0)
	sw $t0, 4968($s0)
	sw $t0, 4972($s0)
	sw $t0, 4976($s0)
	sw $t0, 4980($s0)
	sw $t0, 4984($s0)
	sw $t0, 4988($s0)
	sw $t0, 4992($s0)
	sw $t0, 4996($s0)
	sw $t0, 5000($s0)
	
	# right side
	sw $t0, 1404($s0)
	sw $t0, 1664($s0)
	sw $t0, 1924($s0)
	sw $t0, 2184($s0)
	sw $t0, 2444($s0)
	sw $t0, 2700($s0)
	sw $t0, 2956($s0)
	sw $t0, 3212($s0)
	sw $t0, 3468($s0)
	sw $t0, 3724($s0)
	sw $t0, 3980($s0)
	sw $t0, 4236($s0)
	sw $t0, 4492($s0)
	sw $t0, 4748($s0)
	sw $t0, 5004($s0)
	
	# epilogue
	lw $s0, 0($sp) # popping $t0
	lw $ra, 4($sp) # popping $s0
	addi $sp, $sp 4 # returning stack pointer to normal length
	
	# returning control to main
	jr $ra
	
ClearScreen:
	addi $sp, $sp, -4 # making room for an item on the stack pointer
	sw $ra, 0($sp) # pushing $ra
	
	li $t1, 0x000000 # color black
	
	li $t7, 0x10040000 # i = base address
	LOOP:
		sw $t1, 0($t7) # saving the pixel at current address
		addi $t7, $t7, 4 # incrementing the current address by one pixel
		ble $t7, 0x100422FC, LOOP # loop if current address hasnt reached the last pixel
		
	lw $ra, 0($sp) # popping $ra
	addi $sp, $sp, 4 # returning stack pointer to normal length
	
	jr $ra
	
	
### TURN OFF SUBPROGRAM ###
TurnOffLED:
	# prologue
	addi $sp, $sp, -8 # making room for x items on stack pointer
	sw $ra, 4($sp) # pushing $ra
	sw $s0, 0($sp) # pushing $s0
	
	lw $s0, ADDRESS # saving base address in $s0
	lw $t0, OFFCOLOR # $t0 now has the color WHITE loaded into it
	
	# DRAWING THE LED #
	sw $t0, 1140($s0) # loading the color white onto the memory
	# DRAWING THE LED #
	sw $t0, 1140($s0) # loading the color white onto the memory
	# left side
	sw $t0, 1388($s0)
	sw $t0, 1636($s0)
	sw $t0, 1888($s0)
	sw $t0, 2140($s0)
	sw $t0, 2392($s0)
	sw $t0, 2648($s0)
	sw $t0, 2904($s0)
	sw $t0, 3160($s0)
	sw $t0, 3416($s0)
	sw $t0, 3672($s0)
	sw $t0, 3928($s0)
	sw $t0, 4184($s0)
	sw $t0, 4440($s0)
	sw $t0, 4696($s0)
	sw $t0, 4952($s0)
	
	# bottom
	sw $t0, 4956($s0)
	sw $t0, 4960($s0)
	sw $t0, 4964($s0)
	sw $t0, 4968($s0)
	sw $t0, 4972($s0)
	sw $t0, 4976($s0)
	sw $t0, 4980($s0)
	sw $t0, 4984($s0)
	sw $t0, 4988($s0)
	sw $t0, 4992($s0)
	sw $t0, 4996($s0)
	sw $t0, 5000($s0)
	
	# right side
	sw $t0, 1404($s0)
	sw $t0, 1664($s0)
	sw $t0, 1924($s0)
	sw $t0, 2184($s0)
	sw $t0, 2444($s0)
	sw $t0, 2700($s0)
	sw $t0, 2956($s0)
	sw $t0, 3212($s0)
	sw $t0, 3468($s0)
	sw $t0, 3724($s0)
	sw $t0, 3980($s0)
	sw $t0, 4236($s0)
	sw $t0, 4492($s0)
	sw $t0, 4748($s0)
	sw $t0, 5004($s0)
	
	# epilogue
	lw $s0, 0($sp) # popping $t0
	lw $ra, 4($sp) # popping $s0
	addi $sp, $sp 4 # returning stack pointer to normal length
	
	# returning control to main
	jr $ra
	
### TOGGLE SUBPROGRAM ###
ToggleLED:
	# prologue
	addi $sp, $sp, -8 # making room for x items on stack pointer
	sw $ra, 4($sp) # pushing $ra
	sw $s0, 0($sp) # pushing $s0
	
	lw $s0, ADDRESS # saving base address in $t3
	
	# CHECKING CONDITIONS #
	lw $t0, OFFCOLOR # $t0 now has the color WHITE loaded into it
	lw $t1, 1140($s0) # loading the hex code for the color of the LED into $t1
	beq $t0, $t1, TurnOnLED # turn on LED if it is off
	b TurnOffLED # otherwise, turn off the LED
	 
	# epilogue
	lw $s0, 0($sp) # popping $t0
	lw $ra, 4($sp) # popping $s0
	addi $sp, $sp 4 # returning stack pointer to normal length
	
	jr $ra # returning control back to main
	
### MOVE LEFT ONE PIXEL ###
MoveLeftLED:
	
	# prologue
	addi $sp, $sp, -4 # making room for 1 item on stack pointer
	sw $ra, 0($sp) # pushing $ra
	
	# removing the old LED #
	jal ClearScreen
	
	# drawing new LED #
	lw $a0, ADDRESS # loading the current address into $a0
	addi $a0, $a0, -4 # subtracting a word from the base address to move left one "pixel"
	sw $a0, ADDRESS # saving the new address to the data memory
	li $a1, 0xffffff # loading the color slot with correct color
	jal InitializeLED # reinitializing and drawing the LED
	
	# epilogue
	lw $ra, 0($sp) # popping $ra
	addi $sp, $sp 4 # returning stack pointer to normal length
	
	jr $ra # returning control back to main
	
### MOVE RIGHT ONE PIXEL ###
MoveRightLED:
	
	# prologue
	addi $sp, $sp, -4 # making room for 1 item on stack pointer
	sw $ra, 0($sp) # pushing $ra
	
	# removing the old LED #
	jal ClearScreen
	
	# drawing new LED #
	lw $a0, ADDRESS # loading the current address into $a0
	addi $a0, $a0, 4 # subtracting a word from the base address to move left one "pixel"
	sw $a0, ADDRESS # saving the new address to the data memory
	li $a1, 0xffffff # loading the color slot with correct color
	jal InitializeLED # reinitializing and drawing the LED
	
	# epilogue
	lw $ra, 0($sp) # popping $ra
	addi $sp, $sp 4 # returning stack pointer to normal length
	
	jr $ra # returning control back to main
	
### MOVE UP ONE PIXEL ###
MoveUpLED:
	
	# prologue
	addi $sp, $sp, -4 # making room for 1 item on stack pointer
	sw $ra, 0($sp) # pushing $ra
	
	# removing the old LED #
	jal ClearScreen
	
	# drawing new LED #
	lw $a0, ADDRESS # loading the current address into $a0
	addi $a0, $a0, -256 # subtracting a word from the base address to move left one "pixel"
	sw $a0, ADDRESS # saving the new address to the data memory
	li $a1, 0xffffff # loading the color slot with correct color
	jal InitializeLED # reinitializing and drawing the LED
	
	# epilogue
	lw $ra, 0($sp) # popping $ra
	addi $sp, $sp 4 # returning stack pointer to normal length
	
	jr $ra # returning control back to main
	
### MOVE RIGHT ONE PIXEL ###
MoveDownLED:
	
	# prologue
	addi $sp, $sp, -4 # making room for 1 item on stack pointer
	sw $ra, 0($sp) # pushing $ra
	
	# removing the old LED #
	jal ClearScreen
	
	# drawing new LED #
	lw $a0, ADDRESS # loading the current address into $a0
	addi $a0, $a0, 256 # subtracting a word from the base address to move left one "pixel"
	sw $a0, ADDRESS # saving the new address to the data memory
	li $a1, 0xffffff # loading the color slot with correct color
	jal InitializeLED # reinitializing and drawing the LED
	
	# epilogue
	lw $ra, 0($sp) # popping $ra
	addi $sp, $sp 4 # returning stack pointer to normal length
	
	jr $ra # returning control back to main
	
	
	
	
