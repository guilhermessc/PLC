mirror :: [t] -> [t]
mirror [] = []
mirror (a:as) = [a] ++ mirror as ++ [a]