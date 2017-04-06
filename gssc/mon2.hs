qsort :: (a -> Int) -> [a] -> [a]
qsort f [] = []
qsort f (a:as) = qsort f [ x | x <- as, (f a) > (f x)] ++ [ x | x <- as, (f a) == (f x)] ++ qsort f [ x | x <- as, (f a) < (f x)]

ordenaPeso :: (a -> Int) -> [a] -> [a]
ordenaPeso = qsort