-- What is the type? --
-- ['a', 'b', 'c'] = List of chars, [Char]
-- ('a', 'b', 'c') = triple of char, (Char, Char, Char)
-- tail = [a] -> [a]
-- reverse = [a] -> [a]
-- [tail, reverse] = [[a] -> [a]]

-- What was the type? --
-- length = [a] -> Int
-- head = [a] -> a
-- null = [a] -> Bool
-- take = Int -> [a] -> [a]
-- maximum = Int -> Int -> Int ?!?!? spørg lige om denne
-- sum = [a] -> a
-- elem = a -> [a] -> Bool
-- repeat = a -> [a]
-- cycle = [a] -> [a]
-- succ = Enum a => a -> a

-- Let and where --
rootsWhere :: (Floating t, Ord t) => t -> t -> t -> (t, t)
rootsWhere a b c
  | d > 0 = (((- b) + sqrt d) / (2 * a), ((- b) - sqrt d) / (2 * a))
  | d == 0 = (((- b) + sqrt d) / (2 * a), 0)
  | otherwise = (0, 0)
  where
    d = (b * b) - 4 * a * c

rootsLet :: (Floating t, Ord t) => t -> t -> t -> (t, t)
rootsLet a b c =
  let d = (b * b) - 4 * a * c
   in if d > 0
        then (((- b) + sqrt d) / (2 * a), ((- b) - sqrt d) / (2 * a))
        else
          if d == 0
            then (((- b) + sqrt d) / (2 * a), 0)
            else (0, 0)

second [] = error ("No second element")
second (x:xs) = head xs

secondLast [] = error ("empty list")
secondLast [x, y] = x
secondLast (x:xs) = secondLast xs

swap (x, y) = (y, x)

pair x y = (x,y)

palindrome xs = xs == reverse xs

twice :: (a -> a) -> a -> a
twice f a = f (f a)

flatten :: [[a]] -> [a]
flatten [] = []
flatten [[]] = []
flatten (x:xs) = [a | a <- x] ++ flatten xs


alternate [] = []
alternate [a] = [a]
alternate (x:xs) = [x, negate (head xs)] ++ alternate (tail xs)


setIdx xs e i = setIdxHelper xs e i 0
  where
    setIdxHelper [] _ _ _ = []
    setIdxHelper (x:xs) e i n
      | i == n = e : xs
      | otherwise = x : setIdxHelper xs e i (n+1)

modIdx xs f i = modIdxHelper xs f i 0
  where
    modIdxHelper [] _ _ _ = []
    modIdxHelper (x:xs) f i n
      | i == n = f x : xs
      | otherwise = x : modIdxHelper xs f i (n+1)

unique [] = []
unique (x:xs) = if x `elem` xs then unique xs else x : unique xs


