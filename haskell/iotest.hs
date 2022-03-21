-- This is the file for testing parsing HASKELL --

-- The plan is: --

-- Get the file contents using 'do' notation and using the hGetContents which is lazy --
-- First test with getLine tho --

-- Parse using the split function to remove the commas then concatinate the strings without , and remove the '(' and ')'.

-- Then use the read function to create a STATE object, combine a string to make this easy with the naming.

-- Then think about the rest of the program --