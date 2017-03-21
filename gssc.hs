-- This function mirrors a generic list of elements
mirror :: [t] -> [t]
mirror [] = []
mirror (a:as) = [a] ++ mirror as ++ [a]

-- This function creates a list of n elements
lonel :: Int -> t -> [t]
lonel 0 e = []
lonel n e | n < 0 = error "Invalid argument"
          | otherwise = [e] ++ (lonel (n-1) e)
            
-- This function repeats each element of list n times
rep :: Int -> [t] -> [t]
rep n [] = []
rep n (a:as) = (lonel n a) ++ (rep n as)