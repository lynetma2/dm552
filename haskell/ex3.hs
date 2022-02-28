import Data.Char

-- MAP --
-- mymap implementation --

mymap :: (a -> b) -> [a] -> [b]
mymap f [] = []
mymap f (x:xs) = f x:(mymap f xs)

mysquare = mymap sqrt

myLength :: [String] -> [Int]
myLength = mymap length

doToUpper :: String -> String
doToUpper = mymap toUpper

listToUpper :: [String] -> [String]
listToUpper = mymap doToUpper



-- FILTER --
-- myfilter implementation --
myfilter :: (a -> Bool) -> [a] -> [a]
myfilter _ [] = []
myfilter f (x:xs)
    | f x = x:(myfilter f xs)
    | otherwise = myfilter f xs

underT t = myfilter (t>)

ownfunction a = True

underFilter = filter ownfunction

factors n = myfilter ((== 0) . mod n) [1..n]
isPrime = (==2) . length . factors
primes = filter isPrime [1..]

-- ZIPWITH --
myzip = zipWith (,)

