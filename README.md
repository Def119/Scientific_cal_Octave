# Scientific_cal_Octave
[Github repository Link](https://github.com/Def119/Scientific_cal_Octave)
---

#### **Introduction**

This is a **Scientific Calculator** built using MATLAB/Octave's GUI functionality using `uicontrol library`. This cal provides a wide range of features including:
   - basic arithmetic, 
   - trigonometric calculations (with degree and inverse support), 
   - logarithms (logₑ), 
   - factorial computation, 
   - simple matrix operations,
   - and `π` and `e` values similar to a scientific calculator.

---

#### **Features**

1. **Basic Arithmetic Operations**  
   - Addition (`+`), Subtraction (`-`), Multiplication (`*`), Division (`/`), Exponentiation (`^`). 
   - And also element wise operations in matrices (`./`,`*/`,`.^`) .

2. **Trigonometric Functions**  
   - Supported Functions:  
     `sin`, `cos`, `tan` (for radians).  
     `sind`, `cosd`, `tand` (for degrees).  
   - Inverse Trigonometric Functions:  
     Use the `Inv` button before the function. For example: `asin`, `acos`, `atan`.
     Make sure to add trigonomatric functions before adding trigonometric function relation options and `Also add the desired operator before adding the trigonomatric function`.
     ex: `Inv` and `Deg`

3. **Degree/Radian Switching**  
   - Click on `Deg` button to switch the trigonometric function to calculate in degrees. Has to switch function to degree everytime a function is used, Radiant is used as default in Octave.
     Ex: `sin` -> `sind` , `cos` -> `cosd` , `tan` -> `tand`  
        `sind(30)` computes sine of 30 degrees.  
   - Ensure you add the degree mode (`d`) after inserting the trigonometric function according to octave/MATLAB syntax.

4. **Factorial Function**  
   - Use the `fac` button to insert the `factorial(` function. Make sure to close the parenthesis before moving on from the factorial function.  
   - Works for individual numbers or as part of larger expressions.  
     Example: `5*factorial(3)` computes \( 5 \times 3! \).
5. **Logarithm Function**  
   - Use the `log` button to insert the `log` function. Make sure to insert and close the parenthesis before moving on from the factorial function.  
   - Works for individual numbers or as part of larger expressions.  
     Example: `5*log(3)` computes `5*logₑ3` by default. insert `log2(3)` to compute `log₂2` as in the default Octave syntax.

6. **Constants**  
   - Pi (`π`): Use the `π` button to insert the value of π into your expression.  
   - Euler's number (`e`): Use the `e` button for the constant \( e \).
   - Using `π` or `e` will automatically insert `*` if its not included by the user in order to maintain the consistency in calculations in octave.

7. **Ans Function**  
   - The `Ans` button recalls the last computed result and can be used in subsequent calculations.

8. **Matrix Operations**  
   - Supports basic matrix manipulations using Octave's matrix syntax. 
     Example: Enter `[1,2;3,4]` for a 2x2 matrix. 
   - Combine matrices with arithmetic operators as well as element wise operations such as (`./`,`*/`,`.^`).

9. **Clear and Backspace**  
   - `C`: Clears the entire display.  
   - `CE`: Deletes the last character entered.

---

#### **Usage Tips**

- **Error Handling**: If you encounter an error, the display will show `Error` or Showing the problem with the input. Make sure to clear it using `C`.
    ex: `!! insert trig. func. first !!` error when clicking on `Inv` button before inserting a trigonometric function.
- **Start Fresh**: The display initializes with `0`. Begin your calculations directly.
- **Order of Operations**: Ensure proper parenthesis use and operator inclusion for accurate results.

---
