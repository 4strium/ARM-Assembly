// $$$$$$$\                                    $$\                 $$\      $$\     
// $$  __$$\                                   \__|                $$$\    $$$ |    
// $$ |  $$ | $$$$$$\  $$$$$$\$$$$\   $$$$$$\  $$\ $$$$$$$\        $$$$\  $$$$ |    
// $$$$$$$  |$$  __$$\ $$  _$$  _$$\  \____$$\ $$ |$$  __$$\       $$\$$\$$ $$ |    
// $$  __$$< $$ /  $$ |$$ / $$ / $$ | $$$$$$$ |$$ |$$ |  $$ |      $$ \$$$  $$ |    
// $$ |  $$ |$$ |  $$ |$$ | $$ | $$ |$$  __$$ |$$ |$$ |  $$ |      $$ |\$  /$$ |    
// $$ |  $$ |\$$$$$$  |$$ | $$ | $$ |\$$$$$$$ |$$ |$$ |  $$ |      $$ | \_/ $$ |$$\ 
// \__|  \__| \______/ \__| \__| \__| \_______|\__|\__|  \__|      \__|     \__|\__|
//
// Program that calculate the sum of the first n integers (1+2+3+4+5+...+n)
//
    MOV R0,#1       // I put a register at 1 to start the sequence of odd number
    INP R2,2        // I ask the user up to what number the program should calculate, and I put its response in the R2 register
    B myloop        // I define a main loop 
myloop:
    ADD R1,R0,#1    // I calculate n+1 (even) and I put in the register R1, and so on...   
    ADD R3,R1,R0    // I add R0 and R1, and I put the result in the register R3
    ADD R4,R4,R3    // R4 is the total result of all additions between R0 and R1, which is the register that temporarily stores the calculated results in order to increment them later in register R4
    ADD R0,R1,#1    // I calculate the next odd number to add to the sequence
    B test1         // The program goes to the first comparison loop
test1:
    CMP R0,R2       // I compare the odd number which is in the current addition with the requested maximum, this comparison can only be true if the maximum is also odd.
    BNE test2       // If the comparison is not equal, then I move on to the next test which does exactly the same thing but for even numbers this time.
    ADD R4,R4,R2    // If the comparison is equal, then I add a step to the final result because my main loop does the additions 2 by 2.
    B final         // The program goes to the final loop
test2:
    CMP R1,R2       // I compare the even number which is in the current addition with the requested maximum, this comparison can only be true if the maximum is also even.
    BNE myloop      // If the comparison is not equal, then the program returns to the main loop because this means that all the comparisons (even or odd) have concluded that the maximum has not yet been reached and that it is necessary to continue adding.
    B final         // The program goes to the final loop
final:
    STR R4,100      // I store the final result in memory 100
    OUT R4,4        // I output the final result of the sequence
    HALT            // I stop the execution of the program
