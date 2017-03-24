-- Função de ordenação
qsort :: [Int] -> [Int]
qsort [] = []
qsort (x:l) = qsort [k | k <- l, k<x] ++ [x] ++ qsort [k | k <- l, k>=x]


reduz1 :: [Int] -> [Int]
reduz1 l = let conjunto = qsort l in 
 [conjunto!!i| i <- [0..(length conjunto -2)], (conjunto!!(i+1)) == conjunto!!i]