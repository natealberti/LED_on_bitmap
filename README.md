# LED_on_bitmap
functional LED mapped to a bitmap display on MARS

Video showing the device in use: https://www.youtube.com/watch?v=50SC8UTV9Ms
The controls are as follows: 1: turn on – 2: turn off – 3: toggle - C: move up – E: move down – D: move left – F: move right

This was for my honors project for assembly. It "draws" an LED to the heap and displays it via the bitmap display tool. The keyboard input simulator tool on MARS is also used to control the light.
The main file initializes the LED with proper parameters, then loops through a function which uses the polling method to get input from the keyboard and decode the ASCII values and match them with the corresponding function. In LED.asm, I had to meticulously draw each pixel on the exact offset of the base address. That's why the LED looks kind of awful.
