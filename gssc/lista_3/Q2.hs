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

    makeSet a (LDS s) | find a s /= Nothing = s
                      | otherwise = (LDS (s ++ [[a]]))

-- instance OprDisjointSet TDisjointSet where
