# **Compiler Project using Lex and Yacc**

This project implements a simple compiler using **Lex** (for lexical analysis) and **Yacc** (for syntax analysis).  
The compiler processes a simple programming language with constructs like `if-else`, variable declarations, assignments, and arithmetic expressions.

---

## **Features**

- Tokenizes input code using **Lex**.
- Parses tokens and verifies grammar using **Yacc**.
- Supports constructs like:
  - Variable declarations (`int`, `float`).
  - Arithmetic operations (`+`, `-`, `*`, `/`).
  - Conditional statements (`if`, `else`).
- Error handling for unknown tokens and syntax errors.

---

## **How to Run**

### **Prerequisites**

#### For macOS
1. Install **Flex** and **Bison** using Homebrew:
   ```bash
   brew install flex bison
