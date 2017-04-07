-- 1

collatz :: Int -> Int
collatz 1    = 0
collatz a | (mod a 2) == 0 = 1 + collatz (div a 2)
          | otherwise = 1 + collatz (3*a + 1)

maior_seq_collatz :: [Int] -> Int
maior_seq_collatz a = (foldr1 max (map collatz (filter ( > 0) a)))

