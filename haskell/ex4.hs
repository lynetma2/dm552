import Data.Maybe

data Gender = Male | Female deriving Show

data Person = Person { name :: String,
                       gender :: Gender,
                       age :: Integer
                    } deriving Show

data Course = Course { cName :: String
                     , grade :: Maybe Integer
                     , weight :: Float 
                     } deriving Show 

data Student = Student {  person :: Person
                       ,  num :: String 
                       ,  courses :: [Course]
                       } deriving Show

student1 = Student (Person "John" Male 20) "23232323" [(Course "Math" (Just 12) 0.8), (Course "Danish" (Just 12) 0.5)]
student2 = Student (Person "Jill" Female 21) "23232324" [(Course "Math" (Just (-3)) 0.8), (Course "Danish" (Just 12) 0.5)]

enrol :: Student -> String -> Float -> Student
enrol s name weight 
    | any ((== name) . cName) (courses s) = s
    | otherwise = s { courses = (courses s) ++ [Course name Nothing weight] }

greet :: Person -> String
greet p = "Good morning " ++ name p

hasVotingRight :: Person -> Bool
hasVotingRight = (>= 18) . age 

voters :: [Person] -> [Person]
voters = filter hasVotingRight

averageGrade :: Student -> Float
averageGrade s = wsum / (fromIntegral $ length cs)
    where 
        cs = courses s
        wsum = sum $ [fromInteger (fromJust (grade c)) * weight c | c <- cs, isJust (grade c)]

-- Lights out --
data Lights = Lights [Bool] deriving Show

toggle :: Lights -> Int -> Lights
toggle (Lights ls) i = Lights $ left ++ map not mid ++ right
    where  
        (left, rest) = splitAt (i-1) ls
        (mid, right) = splitAt (if i == 0 then 2 else 3) rest


-- Tic-tac-toe --
data Player = Cross | Nought
data Board = Board [[Maybe Player]]


-- CharLike --
class CharLike a where
    convert :: a -> Char
    similar :: CharLike b => a -> b -> Bool
    similar x y = convert x == convert y

--instance CharLike String where
--    convert = head

instance CharLike Char where
    convert = id

instance CharLike Bool where
    convert True = 'T'
    convert False = 'F'

instance CharLike Integer where
    convert = head . show

class Game g where
    isEnd :: g -> Bool

instance Game Lights where
    isEnd (Lights ls) = and ls

class PlayerSet s where
    players :: s a -> [a]

data PlayerList a = PlayerList [a]

instance PlayerSet PlayerList where
    players (PlayerList xs) = xs

data PlayerTuple a = PlayerTuple (a,a,a)

instance PlayerSet PlayerTuple where
    players (PlayerTuple (x, y, z)) = [x, y, z]

data SinglePlayer a = SinglePlayer a

instance PlayerSet SinglePlayer where
    players (SinglePlayer p) = [p]

-- Functors --
data MyMaybe a = MyJust a | MyNothing

mysucc :: Integer -> Integer
mysucc = succ

myint :: MyMaybe Integer
myint = MyJust 10

instance Functor MyMaybe where
    fmap f (MyJust x) = MyJust $ f x
    fmap f MyNothing = MyNothing

data Box a = Box a 

instance Functor Box where
    fmap f (Box x) = Box $ f x

instance Functor PlayerList where
    fmap f (PlayerList xs) = PlayerList $ map f xs



