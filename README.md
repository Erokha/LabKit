# Welcome to the LabKit!

Labkit provides swift classes & extensions for default swift classes & structres that makes university labs easier

## Safe index

Returns optional value for index.

Example:
```
[1, 2, 3][safe: 2] -> Optional<3>
[1, 2, 3][safe: 5] -> nil
```

## Sugar slices [In progress. Not stable]

Sugar slices is syntax-sugar for swift slices, that make them looks more 'pythonic'.

Example:
```
[1, 2, 3, 4, 5, 6][labkit: -1] -> 6
[1, 2, 3, 4, 5, 6][labkit: -2] -> 5
[1, 2, 3, 4, 5, 6][from: 2] -> [3, 4, 5, 6]
[1, 2, 3, 4, 5, 6][from: 1, to: 4] -> [2, 3, 4]

var array = [1, 2, 3, 4, 5, 6]
array[from: 2] = [9, 9, 9]
print(array) -> [1, 2, 9, 9, 9]

array = [1, 2, 3, 4, 5, 6]
array[from: 1, to: 3] = [9, 9, 9]
print(array) -> [1, 9, 9, 9, 4, 5, 6]
```
