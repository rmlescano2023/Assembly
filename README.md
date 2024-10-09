# Assembly

### This is a repository for Computer Organization and Machine Level Programming (CMSC 131) laboratory exercises using Assembly language.

<br>

## LAB 0

This program takes two integer values from the user and stores it to two created variables named 'jack' and 'jill'. The first operation prints out the values of the two variables. Then, the program swaps the values of the two variables, and then the program prints out the new values.

<br>

## LAB 1

This assembly program solves a puzzle using NASM (Netwide Assembler) syntax and simulates the process of calculating a five-digit code based on provided clues. Here's a breakdown of the main points:

<br>

#### PROBLEM DESCRIPTION

The code uses the digits 1 through 5, with specific rules:
* The first two digits add up to 8.
* The difference between the second and fifth digits equals the fourth digit.
* The middle digit (third) is the quotient of the product of the first and last digits divided by 6.

<br>

#### PROGRAM FLOW

Data Declaration:
* Strings like problem description, answer header, and digits 1–5 are stored in the .data segment.
* Variables a, b, c, d, e are declared in the .bss segment, representing the five digits of the code.

Main Code Logic:
The program prints the problem description and starts solving the clues step by step.
* Clue 1: The first two digits (a and b) add up to 8. The program assumes a = 3, then calculates b = 5.
* Clue 2: The difference between the second (b) and fifth (e) digits equals the fourth (d). The program assumes e = 4, then calculates d = 1.
* Clue 3: The middle digit c is the result of (a * e) / 6. Since a = 3 and e = 4, the product is 12, and 12 / 6 = 2, so c = 2.

Displaying Results:
* The program prints each digit (from a to e).
* Finally, it prints the complete code, which is 35214.

<br>

## LAB 2

<br>

## LAB 3

<br>

## LAB 4

<br>

## LAB 5

<br>

## LAB 6

<br>

## LAB 7

<br>

## LAB 8

<br>

## LAB 9

<br>

## LAB 10

<br>

## LAB 11
