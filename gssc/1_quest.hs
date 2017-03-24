-- 1a questão

import Data.List

qsort :: [Int] -> [Int]
qsort [] = []
qsort (a:as) = qsort [x |x <- as, x < a] ++ [x | x <- (a:as), x == a] ++ qsort [x | x <- as, a < x]

reduz_1 :: [Int] -> [Int]
reduz_1 (a:as) = z \\ [(head z)..(last z)]
               where z = qsort[x | x <- (a:as), [y | y <- (a:as), y == x] /= [x]]

