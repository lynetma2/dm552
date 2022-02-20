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
  | d > 0 = (((- b) + (sqrt d)) / (2 * a), ((- b) - (sqrt d)) / (2 * a))
  | d == 0 = (((- b) + (sqrt d)) / (2 * a), 0)
  | otherwise = (0, 0)
  where
    d = (b * b) - 4 * a * c

rootsLet :: (Floating t, Ord t) => t -> t -> t -> (t, t)
rootsLet a b c =
  let d = (b * b) - 4 * a * c
   in if d > 0
        then (((- b) + (sqrt d)) / (2 * a), ((- b) - (sqrt d)) / (2 * a))
        else
          if d == 0
            then (((- b) + (sqrt d)) / (2 * a), 0)
            else (0, 0)
