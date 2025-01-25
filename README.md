# Scientific_cal_Octave

---

#### **Introduction**

This is a **Scientific Calculator** built using MATLAB/Octave's GUI functionality. It provides a wide range of features including basic arithmetic, trigonometric calculations (with degree and inverse support), factorial computation, and simple matrix operations.

---

#### **Features**

1. **Basic Arithmetic Operations**  
   - Addition (`+`), Subtraction (`-`), Multiplication (`*`), Division (`/`), Exponentiation (`^`). And also element wise operations in matrices (`./`,`*/`,`.^`) .

2. **Trigonometric Functions**  
   - Supported Functions:  
     `sin`, `cos`, `tan` (for radians).  
     `sind`, `cosd`, `tand` (for degrees).  
   - Inverse Trigonometric Functions:  
     Use the `Inv` button before the function. For example: `asin`, `acos`, `atan`.

3. **Degree/Radian Switching**  
   - Click on `Deg` button to switch the trigonometric function to calculate in degrees. Has to switch function to degree everytime a function is used, Radiant is used as default in Octave.
     Ex: `sin` -> `sind` , `cos` -> `cosd` , `tan` -> `tand`  
        `sind(30)` computes sine of 30 degrees.  
   - Ensure you add the degree mode (`d`) after inserting the trigonometric function.

4. **Factorial Function**  
   - Use the `fac` button to insert the `factorial(` function.  
   - Works for individual numbers or as part of larger expressions.  
     Example: `5*factorial(3)` computes \( 5 \times 3! \).

5. **Constants**  
   - Pi (`π`): Use the `π` button to insert the value of π into your expression.  
   - Euler's number (`e`): Use the `e` button for the constant \( e \).
   - Using `π` or `e` will automatically insert `*` if its not included by the user in order to maintain the consistency in calculations in octave.

6. **Ans Function**  
   - The `Ans` button recalls the last computed result and can be used in subsequent calculations.

7. **Matrix Operations**  
   - Supports basic matrix manipulations using Octave's matrix syntax. 
     Example: Enter `[1,2;3,4]` for a 2x2 matrix. 
   - Combine matrices with arithmetic operators as well as element wise operations such as (`./`,`*/`,`.^`).

8. **Clear and Backspace**  
   - `C`: Clears the entire display.  
   - `CE`: Deletes the last character entered.

---

#### **Usage Tips**

- **Error Handling**: If you encounter an error, the display will show `Error` or Showing the problem with the input. Make sure to clear it using `C`.
    ex: `!! insert trig. func. first !!` error when clicking on `Inv` button before inserting a trigonometric function.
- **Start Fresh**: The display initializes with `0`. Begin your calculations directly.
- **Order of Operations**: Ensure proper parenthesis use for accurate results.

---
