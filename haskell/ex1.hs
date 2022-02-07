doubleMe x = 2*x

doubleUs x y = 2*x + 2*y

maybeDouble x = (if x < 100 then 2*x else x) + 1

-- List excersises

numberList = [2,3,4,5,6,7,8]

stringList = ["test", "lorem", "ipsum", "tes"]

charList = ['a', 'b', 'c', 'd']

-- Syntax for getting index is !! operator

a = (stringList !! 1) !! 2

b = "Hello World"!!8

-- Better functions part --

c 1 = 1
c 2 = 5
c x = 2*x

-- list functions

d [] = 0
d [x] = x
d (x:_) = 2*x

-- Auxilliary methods --
myhead [] = 0
myhead (x:_) = x


--mytail [] = 0 Spørg om hjælp til denne underlig fejl
mytail (_:x) = x

-- Spørg om hjælp til null metoden --

mylast [] = 0
mylast [x] = x
mylast (_:x) = mylast x

mylength [] = 0
mylength (x:y) = 1 + mylength y

myString = "hello"

moreThanFourChars = [x | x <- stringList, length x > 3 ]

-- 2.4 Tuples --

names = ["Anders", "Lise Lotte", "Mette", "Jan"]
ages = [22, 50, 24, 51]

zipped = zip names ages
advancedFilters = [(x,y) | (x,y) <- zipped, ((x !! 0) == 'A') || ( length x > 5) || ( y > 50 )] 

pf ((x:_) , y) = "Your in the " ++ (x : "-club")
-- Spørg om hjælp til denne opgave --

age (d,m,y) (d1,m1,y1) = y1-y

-- 2.4.2 --
dist (x,y) = sqrt (x*x + y*y)
y = [1,2,3,4,5]
x = [5,4,3,2,1]
zippedCoordinates = zip x y
zippedCoordinatesR = zip y x

listDist = [ dist x | x <- zippedCoordinates ]

distBetween ((x1, y1),(x2, y2)) = sqrt ((x2-x1)*(x2-x1))+((y2-y1)*(y2-y1))

doubleZip = zip zippedCoordinates zippedCoordinatesR

listDDist = [distBetween x | x <- doubleZip ]