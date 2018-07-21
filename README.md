# Programming Challenge

## Python implementation
**Usage:** ``` python challenge.py <input_file> <output_file> ```

**Time Complexity:** O(N) where N is the number of digits per case.


## Prolog implementation
**Usage:** ``` swipl -s challenge.pl -g 'main("<input_file>", "<output_file>")' -t halt ```

**Time Complexity:** O(N) where N is the number of digits per case.

## Solution explanation
 1. Find the digit index in which the number stop being ordered. 
 3. Replace all digits after the index with 9 (the max ordered number possible).
 4. Subtract 1 to last ordered digit. This can affect the previous digits; in that case we replace current digit with 9 and repeat this step with the previous one.
