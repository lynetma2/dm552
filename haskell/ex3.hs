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


-- 1.3 Fold --
factorial :: Integer -> Integer
factorial n = foldr (*) 1 [1..n]

mymaximum :: Ord a => [a] -> a
mymaximum [] = error "empty list"
mymaximum (x:xs) = foldl max x xs

rev :: [a] -> [a]
rev = foldl (flip (:)) []

mylast :: [a] -> a
mylast xs = foldl1 (curry snd) xs

isSorted :: Ord a => [a] -> Bool
isSorted [] = True
isSorted xs = snd $ foldr f (last xs, True) (init xs)
    where
        f x (_, False) = (x, False)
        f x (y, b) = (x, b && x <= y)

isSorted' xs = foldr (&&) True $ map (uncurry (<=)) $ zip xs (tail xs)

myfilter' :: (a -> Bool) -> [a] -> [a]
myfilter' p l = foldl1 (++) (map foo l)
    where
        foo x
          | p x = [x]
          | otherwise = []

length' :: [a] -> Integer
length' = foldr (\_ acc -> acc + 1) 0

elem' :: Eq a => a -> [a] -> Bool
elem' x = any (== x)

