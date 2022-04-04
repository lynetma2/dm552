import System.IO
import Data.Char (toUpper, isUpper)
import Data.Maybe
import qualified Data.Map as M

prog1 = putStrLn "Hello World"

prog2 = do
    name <- getLine
    putStrLn name

prog3 = do
    content <- getContents
    return $ length $ lines content

prog4 = do
    content <- getContents
    return $ map toUpper content

-- Scoreboard thing --
scoreBoard :: FilePath -> IO (String, String)
scoreBoard path = do
    content <- readFile path
    let [players, points] = lines content
    return (players, points)

calcScores :: (String, String) -> M.Map Char Integer
calcScores (players, points) = foldr f m points
    where
        m = M.fromList $ zip players (repeat 0)
        f c scores = let v = if isUpper c then 1 else (-1) in
            M.adjust (+ v) (toUpper c) scores

showScores :: M.Map Char Integer -> String
showScores = M.foldrWithKey f ""
    where
        f k v s = s ++ [k] ++ ": " ++ show v ++ "\n"

