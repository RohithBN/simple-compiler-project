Compiler Project using Lex and Yacc

This project implements a simple compiler using Lex (for lexical analysis) and Yacc (for syntax analysis).
The compiler processes a simple programming language with constructs like if-else, variable declarations, assignments, and arithmetic expressions.


How to Run

Prerequisites
Flex and Bison: Install them using Homebrew:
brew install flex bison
GCC: Ensure GCC is installed for compiling the generated C files.
Steps to Run
Clone the repository:
git clone https://github.com/your-username/compiler-project.git
cd compiler-project
Generate the lexical analyzer:
flex lex.l
Generate the syntax analyzer:
bison -d parser.y
Compile the generated files:
gcc lex.yy.c parser.tab.c -o compiler
Run the compiler with a test file:
./compiler < input.txt
