-- simulate game implementation --
-- Idea --
-- simulateGameAux :: <Inital State> -> [Moves] -> String containing the final game state or any errors.

-- Initial State contains <cards>, <pawns1>, <pawns2>, <turn>, <sm1>, <sm2> --
-- Example input: (["Cobra","Rabbit","Rooster","Tiger","Monkey"],[(0,2),(0,0),(0,1),(0,3),(0,4)],[(4,2),(4,0),(4,1),(4,3),(4,4)],0,True,False)

data Card = Card { cardName :: String
                 , moves :: [(Int, Int)]}

data State = State { cards :: [Card]
                   , pawns1 :: [(Int, Int)]
                   , pawns2 :: [(Int, Int)]
                   , turn :: Bool
                   , sm1 :: Bool
                   , sm2 :: Bool}

--isValidMove pos1 pos2 name = moves (getCard name) 
testMove :: (Num a, Eq a) => (a, a) -> (a, a) -> [(a, a)] -> Bool 
testMove (_,_) (_,_) [] = False
testMove (x1, y1) (x2, y2) ((a,b):xs) = ((x1+a, y1+b) == (x2, y2)) || testMove (x1, y1) (x2,y2) xs

--monkey :: Card
--monkey = Card {name="Monkey", moves=[(-1 , -1), (-1, (+1)), ((+1), -1), ((+1) , (+1))]}