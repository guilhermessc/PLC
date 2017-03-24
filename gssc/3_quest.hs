-- 3a questão

import Data.Bits

size_list :: [Int] -> Int
size_list [] = 0
size_list (a:as) = 1 + size_list(as)

exclui_n :: Int -> [Int] -> [Int]
exclui_n n a | n > (size_list a) || n < 1 = a
             | otherwise = (take (n-1) a) ++ (drop n a)

codify_aux :: [Int] -> Int -> Int -> [Int]
codify_aux a codigo 0 = a
codify_aux a codigo i | (((.&.) (2^(i-1)) codigo) /= 0) = (codify_aux a codigo (i-1))
                      | otherwise = (codify_aux (exclui_n i a) codigo (i-1)) 

codify :: [Int] -> Int -> [Int]
codify a 0 = []
codify a b = codify_aux a b (size_list a)

comb_aux :: [Int] -> Int -> [[Int]]
comb_aux a n | n == 2^(size_list a) = [[]] 
             | otherwise = [(codify a n)] ++ (comb_aux a (n+1))

comb :: [Int] -> [[Int]]
comb a = comb_aux a 1
