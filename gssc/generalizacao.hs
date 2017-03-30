total :: (Int -> Int) -> Int ->Int
total f 0 = f 0
total f n = (total f (n-1)) + (f n)

vendas :: Int -> Int
vendas 0 = 0
vendas 1 = 10
vendas 2 = 15
vendas 3 = 5
vendas 4 = 30
vendas 5 = 10
vendas 6 = 50
vendas n = error "menos jovem"

total_de_vendas :: Int -> Int
-- total_de_vendas 0 = vendas 0
-- total_de_vendas n = (vendas n) + (total_de_vendas (n-1))
total_de_vendas n = total (vendas) n 

sum_sqrs :: Int -> Int
-- sum_sqrs 0 = sq 0
-- sum_sqrs n = (sq n) + (sum_sqrs (n-1))
sum_sqrs n = total (sq) n  

sq :: Int -> Int
sq a = a*a 


is_cresc :: (Int -> Int) -> Int -> Bool
is_cresc f 0 = True
is_cresc f a = ((f a) >= (f (a-1))) && (is_cresc f (a-1))

test_func :: Int -> Int
test_func x = -x

-- mapping :: (u -> t) -> [u] -> [t]
-- -- mapping f [] = []
-- -- mapping f (a:as) = [f a] ++ (mapping f as)
-- mapping f a = [ f x | x <- a]

example :: Int
example = foldr1 (+) [1..10]

-- -----------------------------------------------------------------------------------------

sqr_list :: [Int] -> [Int]
sqr_list a = map sqre a
         where sqre x = x*x

sqr_sum :: [Int] -> Int
-- sqr_sum a = foldr1 (+) (sqr_list a)
-- sqr_sum a = foldr1 (\x -> \y -> x*x + y*y) a -- errado
sqr_sum a = foldr1 (\x -> \y -> x + y) (sqr_list a) 

-- bz :: Int -> Bool
-- bz a = a > 0

filter_bz :: [Int] -> [Int]
filter_bz a = filter (\bz -> bz > 0) a

-- composição de funções (.)
composicao_exemplo :: Int
composicao_exemplo = (soma1 . soma1) 2
                   where soma1 x = x + 1

