// $$$$$$$\                                    $$\                 $$\      $$\     
// $$  __$$\                                   \__|                $$$\    $$$ |    
// $$ |  $$ | $$$$$$\  $$$$$$\$$$$\   $$$$$$\  $$\ $$$$$$$\        $$$$\  $$$$ |    
// $$$$$$$  |$$  __$$\ $$  _$$  _$$\  \____$$\ $$ |$$  __$$\       $$\$$\$$ $$ |    
// $$  __$$< $$ /  $$ |$$ / $$ / $$ | $$$$$$$ |$$ |$$ |  $$ |      $$ \$$$  $$ |    
// $$ |  $$ |$$ |  $$ |$$ | $$ | $$ |$$  __$$ |$$ |$$ |  $$ |      $$ |\$  /$$ |    
// $$ |  $$ |\$$$$$$  |$$ | $$ | $$ |\$$$$$$$ |$$ |$$ |  $$ |      $$ | \_/ $$ |$$\ 
// \__|  \__| \______/ \__| \__| \__| \_______|\__|\__|  \__|      \__|     \__|\__|
//
// Program that calculates the sequence of "n" numbers (given in input) of the 
// Fibonacci sequence by saving them from memory address 100.
//
// Registers R0, R1 and R2 are the registers used for the calculations of the sequence 
// and whose results are directly stored in the memory by the command “STR”. 
//
// Register R3 is the memory address counter, it starts at address 102 because 
// there are first 0 and 1 which are the starting values of the registers.      
//
// Finally, Register R4 temporarily stores the final value entered by the user, 
// and compares it with the memory address counter (R3).      
//                                                                                                                                                   
    INP R4,2
    ADD R4,R4,#100
    MOV R3,#102
    MOV R1,#1
    STR R1,101
    B while
while:
    ADD R2,R1,R0
    STR R2,[R3]
    CMP R3,R4
    BEQ final
    ADD R3,R3,#1
    ADD R0,R1,R2
    STR R0,[R3]
    CMP R3,R4
    BEQ final
    ADD R3,R3,#1
    ADD R1,R2,R0
    STR R1,[R3]
    CMP R3,R4
    BEQ final
    ADD R3,R3,#1
    B while
final:
    HALT