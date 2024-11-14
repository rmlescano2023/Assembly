# Assembly

### This is a repository for Computer Organization and Machine Level Programming (CMSC 131) laboratory exercises using Assembly language.

<br>

## LAB 00

This assembly program for NASM allows a user to input two integer values into variables named 'jack' and 'jill', then displays their values, swaps the two variables, and prints the new values. The program is structured into three main phases: taking input from the user, printing the initial values ("Before the fall"), and swapping the values of 'jack' and 'jill' before printing the swapped values ("After the fall"). It uses basic input/output operations, arithmetic, and data movement to accomplish the task, demonstrating foundational assembly programming concepts like variable manipulation and stack management.

<br>

## LAB 01

This program solves a logical puzzle by computing a five-digit code based on specific clues. The puzzle involves the sum of the first two digits equaling 8, the difference between the second and fifth digits equaling the fourth digit, and the middle digit being the quotient of the product of the first and last digits divided by 6. The program systematically computes the values of each digit: the first digit is 3, the second is 5, the fifth is 4, the fourth is 1, and the third is 2. These values are derived using arithmetic operations, and the final code `35214` is displayed. The program demonstrates efficient use of assembly language for problem-solving, utilizing basic control flow, arithmetic, and output formatting.

<br>

## LAB 02

This assembly program checks whether a given year is a leap year based on user input. It mirrors the functionality of the C program that evaluates leap years using the following conditions:

* If the year is divisible by 400, it is a leap year.
* If the year is divisible by 100 but not by 400, it is not a leap year.
* If the year is divisible by 4 but not by 100, it is a leap year.
* Any other case means the year is not a leap year.

The program prompts the user to enter a year, performs division to check for leap year conditions, and prints the corresponding message. It uses division operations and conditional jumps to control the flow based on the remainders of the division. The results are printed based on whether the year meets the criteria for being a leap year or not.

<br>

## LAB 03

This assembly program calculates the least common multiple (LCM) of two integers provided by the user. The program first prompts the user for two integer inputs and checks if either of the numbers is zero, as the LCM is undefined in such cases. 

The program determines the maximum and minimum of the two input values and initializes a multiplier to start from one. It then enters a loop where it multiplies the maximum value by the current multiplier and checks if the result is divisible by the minimum value. If it is divisible, that result is the LCM; if not, the multiplier is incremented, and the process repeats until a valid LCM is found.

The program concludes by displaying the two input integers and their corresponding LCM. If either of the inputs is zero, it indicates that the LCM is undefined.

<br>

## LAB 04

This assembly program performs bitwise shifting operations on a user-provided integer. It begins by prompting the user to enter a number and the number of bit positions to shift. Once the inputs are received, the program executes a left shift (`<<`), which multiplies the number by \(2^n\) (where \(n\) is the specified number of positions), followed by a right shift (`>>`), which divides the number by \(2^n\) and truncates any remainder. The results of both operations are then displayed, showing the original number along with the results of the left and right shifts. This program effectively demonstrates the fundamentals of bitwise operations in assembly language, providing insight into how integer values can be manipulated at the bit level.

<br>

## LAB 05

This assembly program performs bitwise operations on two integers input by the user. It begins by prompting the user to enter two numbers and then stores these values. The program calculates the results of three bitwise operations: AND (`&`), OR (`|`), and XOR (`^`). For each operation, the results are stored in separate variables. After computing the results, the program prints out each operation along with its result in a formatted output. The structure of the program showcases the fundamental principles of bitwise manipulation, providing a clear understanding of how these operations work at the binary level and how they can be implemented in assembly language.

<br>

## LAB 06

This assembly program calculates the factorial of a user-defined number. It starts by prompting the user for input and initializes necessary variables to store the input number, a counter for the loop, and the product (which will hold the factorial result). The program then enters a loop where it multiplies the current product by the counter, incrementing the counter until it reaches the user-defined number. If the counter exceeds or equals the input number, the loop terminates, and the program proceeds to display the results. The output includes a message showing the input number and its corresponding factorial. This structure emphasizes basic programming concepts such as loops, conditionals, and arithmetic operations within assembly language, showcasing how to implement a common mathematical function at a low level.

<br>

## LAB 07

This assembly program is designed to calculate the factorial of a user-defined number while demonstrating the use of a multi-module structure. It starts by prompting the user to enter a number for which the factorial is to be calculated. The program employs an external function, `get_int`, to read the user input and store it in a variable.

After obtaining the input, the program pushes the address of the variable that will store the result onto the stack and calls the external `factorial` function to perform the calculation. Once the factorial is computed, the program retrieves the result and prints it alongside a message that indicates which number's factorial has been calculated.

The program is structured to emphasize the separation of functionality across different modules, which enhances maintainability and readability. By using external functions for input handling and factorial calculation, the program showcases a modular approach to assembly language programming, allowing for clearer organization of code and easier debugging.

<br>

## LAB 08

This assembly program is designed to generate a multiplication table based on user input received from a C file. The main function of the program is encapsulated in the `mult` procedure, which handles both the rows and columns of the multiplication table.

The program begins by initializing variables for the product, row count, and column count, all starting at 1. It then enters an outer loop responsible for iterating through each row of the table. For each row, it initializes the column counter to 1 and compares it with the user input (which is passed through the stack). If the current row count exceeds the user input, the loop ends.

Within the outer loop, an inner loop manages the columns. The column counter is again initialized to 1 and checked against the user input. If the column count exceeds the user input, the inner loop exits. During each iteration of the inner loop, the current row and column counts are multiplied to produce the product, which is stored in memory. The result is printed with a tab character for formatting, followed by the actual product value.

After finishing all columns for a particular row, the program prints a newline character to start the next row. The outer loop continues until all specified rows have been processed, at which point the program concludes. This structured approach to generating a multiplication table effectively demonstrates the use of loops and basic arithmetic operations in assembly language.

<br>

## LAB 09

This assembly program computes Fibonacci numbers in a series, which can be interfaced with a C program. It begins by defining data segments for initialized and uninitialized data, including a message for an error case when the series is requested to start from zero. 

In the main `fibonacci` function, the program first sets up the routine by checking the user input value from the C program. If the input is zero, it jumps to an error handler to print "No series." If the input is one, it directly prints the first number in the Fibonacci sequence, which is 0, and exits. 

For inputs greater than one, the program initializes the first two numbers of the Fibonacci series: 0 and 1. It sets the series counter to 2 since these two numbers account for the first two terms in the sequence. A loop then begins, checking the current counter against the user input. If the counter reaches or exceeds the input value, the loop ends.

Inside the loop, the program calculates the next Fibonacci number by adding the two preceding numbers (stored in `num1` and `num2`). This new number is stored in a variable called `sum` and printed. The program then updates `num1` and `num2` for the next iteration of the loop by shifting their values appropriately.

The loop continues until the counter meets the user input, ensuring the program outputs the correct number of Fibonacci terms. Finally, the program concludes with newline characters for formatting before exiting. Overall, this program showcases basic arithmetic operations and control flow in assembly language to generate a sequence of Fibonacci numbers.

<br>

## LAB 10

This assembly program allows the user to create an array of integers and print its contents. It begins by defining constants for the maximum array size and includes prompts for user interaction in the data segment. In the uninitialized data segment, it declares an array of 100 integers and variables to store the actual size of the array and the current index. The program's entry point, `asm_main`, sets up the stack frame and prompts the user to input the size of the array, which is stored in the `array_size` variable. An index is initialized to zero, and the program enters a loop to collect values from the user, storing each input in the array until the array is filled. After the values are collected, the program prints the contents of the array with a space between each number for better readability. The program concludes with newline calls for formatting before exiting, and there is a placeholder for sorting functionality, indicating that this feature can be implemented later. Overall, the program effectively demonstrates basic array manipulation in assembly language, focusing on user interaction, input handling, and output formatting.

<br>

## LAB 11

This assembly program demonstrates the use of string manipulation instructions, specifically by implementing two functions: `asm_copy` and `asm_strlen`. The `asm_copy` function is designed to copy a block of memory from a source address to a destination address, utilizing the `movsb` instruction in a loop controlled by the value of the size parameter. It begins by setting up the stack frame and saving the registers `esi` and `edi`, which are used to hold the source and destination addresses, respectively. The direction flag is cleared to ensure that the copying proceeds forward in memory. The function then executes `rep movsb`, which repeatedly copies bytes from the source to the destination based on the specified size. After the copy operation, the function restores the saved registers and exits.

The second function, `asm_strlen`, calculates the length of a null-terminated string. It initializes the `edi` register with the address of the string and sets the `ecx` register to the maximum value to ensure it scans the entire string. Using the `scasb` instruction, the function searches for the null terminator (`0`) in the string. Since the `repnz scasb` instruction overshoots the null terminator, the length is computed by subtracting the final value of `ecx` from `0FFFFFFFEh`, effectively yielding the correct length of the string excluding the null terminator. Both functions exemplify the effective use of assembly language for memory and string manipulation, showcasing fundamental concepts in low-level programming.
