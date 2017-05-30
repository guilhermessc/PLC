f :: Int -> [Int]
f n = [1] ++ [x*y| (x,y) <- zip [2..n] ( f (n-1))]

data Stackp = S Int Stackp | Nope
   deriving Show

insert :: Stackp -> Int -> Stackp
insert x n = S n x

top :: Stackp -> Maybe Int
top Nope = Nothing
top (S n s) = Just n

pop :: Stackp -> Stackp
pop Nope = Nope
pop (S n x) = x

il :: Stackp -> [Int] -> Stackp
il p [] = p
il p (n:ns) = S n (il p ns)

prime_filter :: [Int] -> [Int]
prime_filter [] = []
prime_filter (a:as) | [ 1| x <- as, mod x a == 0] /= [] = (prime_filter as)
                    | otherwise = [a] ++ (prime_filter as)


prime_list :: [Integer] -> [Integer]
prime_list [] = []
prime_list (1:t) = (prime_list t)
prime_list (a:as) | divisors == [] = [a] ++ (prime_list as)
                  | otherwise = (prime_list as)
        where divisors = [ x | x <- [2..(a-1)], mod a x == 0]


data Bin_tree = Bt Int Bin_tree Bin_tree | Nulo
    deriving Show

insert_bt :: Bin_tree -> Int -> Bin_tree
insert_bt (Nulo) v = (Bt v Nulo Nulo)
insert_bt (Bt i min max) v | v > i = Bt i min (insert_bt max v)
                           | v < i = Bt i (insert_bt min v) max
                           | otherwise = (Bt i min max)

avr_lista :: Bin_tree -> [Int]
avr_lista Nulo = []
avr_lista (Bt v min max) = (avr_lista min) ++ [v] ++ (avr_lista max)

soma_avr :: Bin_tree -> Int
soma_avr Nulo = 0
soma_avr a = foldr1 (+) (avr_lista a)

list_avr :: [Int] -> Bin_tree
list_avr [] = Nulo
list_avr (a:as) = (insert_bt (list_avr as) a)





