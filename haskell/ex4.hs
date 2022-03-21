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

