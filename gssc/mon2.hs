import Data.Char

-- 1

qsort :: (a -> Int) -> [a] -> [a]
qsort f [] = []
qsort f (a:as) = qsort f [ x | x <- as, (f a) >= (f x)]++ [a] ++ qsort f [ x | x <- as, (f a) < (f x)]

ordenaPeso :: (a -> Int) -> [a] -> [a]
ordenaPeso = qsort

mais_um :: Int -> Int
mais_um a = a+1


-- 2

my_and :: [Bool] -> Bool
my_and a = foldr1 (&&) a

-- definindo uma função sem declarar os tipos
my_concat x = foldl1 (++) x

my_add_list :: [Int] -> Int
my_add_list = foldl1 (+)

-- 3

q3 :: [Char] -> [Char]
q3 x = map toUpper (filter (\z -> not (num z)) x) ++ (filter num x)
    where num = (\a -> ([] /= [v | v <- ['0'..'9'], v == a]))