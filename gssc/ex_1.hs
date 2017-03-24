








-- 3a questão

import Data.Bits


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



-- cat_list :: [Int] -> Int -> [[Int]]
-- cat_list [] a = [[a]]
-- cat_list (x:xs) a = [[a] ++ (x:xs)] ++ (cat_list xs a) 

-- cat_sublist :: [Int] -> Int -> Int-> [[Int]]
-- cat_sublist a b c | c == (size_list a) = (cat_list a b)   
--                   | otherwise = (cat_list (exclui_n c a) b) ++ (cat_sublist a b (c+1)) 

-- comb :: [Int] -> [[Int]]
-- comb [] = [[]]
-- comb (a:as) = (cat_sublist as a 0) ++ (comb as)

-- 1a questão

-- import Data.List

qsort :: [Int] -> [Int]
qsort [] = []
qsort (a:as) = qsort [x |x <- as, x < a] ++ [x | x <- (a:as), x == a] ++ qsort [x | x <- as, a < x]

-- reduz_1 :: [Int] -> [Int]
-- reduz_1 (a:as) = z \\ [(head z)..(last z)]
--                where z = qsort[x | x <- (a:as), [y | y <- (a:as), y == x] /= [x]]



-- 2a questão

size_list :: [Int] -> Int
size_list [] = 0
size_list (a:as) = 1 + size_list(as)

tupla_q :: [Int] -> [(Int, Int)]
tupla_q [] = []
tupla_q (a:as) = tupla_q [ x | x <- as, x < a] ++ [(a, (size_list [x | x <- (a:as), x == a]))] ++ tupla_q [ x | x <- as, a < x]

