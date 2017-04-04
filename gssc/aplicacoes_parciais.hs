multiply :: Int -> Int -> Int
multiply a b = a*b

m2 :: Int -> Int
m2 = multiply 2

iter :: Int -> (t -> t) -> t -> t
iter 0 f = id
iter n f = f . (iter (n-1) f)