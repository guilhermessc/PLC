multiply :: Int -> Int -> Int
multiply a b = a*b

m2 :: Int -> Int
m2 = multiply 2

iter :: Int -> (t -> t) -> t -> t
iter 0 f = id
iter n f = f . (iter (n-1) f)

-- examples from cmd line ----------------------------
-- iter 10 m2 3
-- iter 10 (*2) 3
-- iter 10 (`div` 2) 30000
------------------------------------------------------