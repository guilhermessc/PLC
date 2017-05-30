remove1 :: [Int] -> [Int]
remove1 [] = []
remove1 (a:as) = [ x | x <- as, x==a] ++ remove1 [ x | x <- as, x/=a]

seq_remove :: [Int] -> [Int]
seq_remove [] = []
seq_remove [_] = []
seq_remove (a:as) | a == (head as) = [a] ++ (seq_remove as)
                  | otherwise = (seq_remove as)

seq_remove2 :: [Int] -> [Int]
seq_remove2 (a:as) = [ x | (x,y) <- (zip (a:as) as), x==y]



