class OprDisjointSet v where
    makeSet :: Int -> v -> v
    union :: Int -> Int -> v -> v
    find :: Int -> v -> Maybe Int

data LDisjointSet = LDS [[Int]]
     deriving (Eq, Show)

data TDisjointSet = Void | TDS [Int] TDisjointSet
     deriving (Eq, Show)

instance OprDisjointSet LDisjointSet where

    find _ (LDS []) = Nothing 
    find a (LDS ((h:hs):t)) | [ 1 | x <- (h:hs), x == a] /= [] = Just h
                            | otherwise = find a (LDS t)  

    makeSet a (LDS s) | find a (LDS s) /= Nothing = (LDS s)
                      | otherwise = (LDS (s ++ [[a]]))

    union x y s | find x s == find y s = s
                | find x s == Nothing = s
                | find y s == Nothing = s
    union x y (LDS s) = (LDS ([ a | a <- s, Just (head a) /= find x (LDS s) && Just (head a) /= find y (LDS s)] ++ [head[ a | a <- s, Just (head a) == find x (LDS s)] ++ head[ a | a <- s, Just (head a) == find y (LDS s)]]))


instance OprDisjointSet TDisjointSet where

    find _ Void = Nothing
    find a (TDS (h:hs) nxt) | [ 1 | x <- (h:hs), x == a] /= [] = Just h
                            | otherwise = find a nxt

    makeSet a s | find a s /= Nothing = s
                | otherwise = (TDS [a] s)

    union x y s | find x s == find y s = s
                | find x s == Nothing = s
                | find y s == Nothing = s
    union x y (TDS s (TDS s2 nxt)) | (find x (TDS s (TDS s2 nxt)) == Just (head s) || find y (TDS s (TDS s2 nxt)) == Just (head s)) && (find x (TDS s (TDS s2 nxt)) == Just (head s2) || find y (TDS s (TDS s2 nxt)) == Just (head s2)) = (TDS (s ++ s2) nxt)
                                   | (find x (TDS s (TDS s2 nxt)) /= Just (head s) && find y (TDS s (TDS s2 nxt)) /= Just (head s)) = (TDS s (union x y (TDS s2 nxt)))
                                   | (find x (TDS s (TDS s2 nxt)) == Just (head s) || find y (TDS s (TDS s2 nxt)) == Just (head s)) && (find x (TDS s (TDS s2 nxt)) /= Just (head s2) && find y (TDS s (TDS s2 nxt)) /= Just (head s2)) = (TDS s2 (union x y (TDS s nxt)))
