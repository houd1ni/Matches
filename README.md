# Matches
Matches equal problem solver

This tiny function solves problems with matches like "7-1=2", where we need to move one match to win.
If the case of many solutions, use 'add'=true (described below) to continue calculatin even after first solution was found.

signature is: calculate_matches(input_string, add, trace, callback(output string))

there 'add' and 'trace' are optional.
when 'add' is true, each new solution puts on new line
when 'trace' is on, we can see how it counts in console.

Example is in "in browser test" folder. Be fair! ;^)
