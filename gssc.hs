-- This function mirrors a generic list of elements

mirror :: [t] -> [t]
mirror [] = []
mirror (a:as) = [a] ++ mirror as ++ [a]