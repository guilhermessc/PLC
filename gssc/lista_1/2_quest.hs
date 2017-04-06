-- 2a questão

size_list :: [Int] -> Int
size_list [] = 0
size_list (a:as) = 1 + size_list(as)

tupla_q :: [Int] -> [(Int, Int)]
tupla_q [] = []
tupla_q (a:as) = tupla_q [ x | x <- as, x < a] ++ [(a, (size_list [x | x <- (a:as), x == a]))] ++ tupla_q [ x | x <- as, a < x]
