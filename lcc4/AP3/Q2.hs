data LDisjointSet = LDS [[Int]]
 deriving (Eq, Show)

data TDisjointSet = Void | TDS [Int] TDisjointSet
 deriving (Eq, Show)
 
 
delTDS :: Int -> TDisjointSet -> TDisjointSet
delTDS x Void = Void
delTDS x (TDS l r) | [q | q <- l, q==x] /= [] = r
                   | otherwise = TDS l (delTDS x r)


class OprDisjointSet t where
    find :: Int->t-> Maybe Int
    makeSet :: Int->t->t
    union :: Int->Int->t->t 
    uniao :: Int->t->[Int]

instance  OprDisjointSet LDisjointSet where
       find y (LDS []) = Nothing
       find y (LDS((h:th):t)) 
                       |([x |x<-(h:th),x==y] /= []) = Just h 
                       | otherwise = (find y (LDS t))

       makeSet y (LDS (g)) | (find y (LDS (g))) == Nothing =(LDS ((g++ [[y]]))) 
                           | otherwise =  (LDS (g)) 
              
       uniao y  (LDS []) = []
       uniao y (LDS (h:t)) 
              | ([x |x<-h,x==y] == []) = (uniao y (LDS t))
              | otherwise = h
              
       union x y (LDS (z)) = LDS ([(uniao x (LDS (z))) ++ (uniao y (LDS (z)))] ++ [k | k <- z, find x (LDS z) /= Just (head k) && find y (LDS z) /= Just (head k) ])


instance  OprDisjointSet TDisjointSet where
--x vai ser uma lista, ou void
     find _ Void = Nothing
     find y (TDS (h:t) x) | [x | x<-(h:t), x == y] /= [] = Just h
                          |otherwise = find y x

     makeSet y  x | find y x /= Nothing = x
                  | otherwise = (TDS [y] x)

     uniao y (Void) = []
     uniao y (TDS c x)
            | ([z |z<-c,z==y] == []) = (uniao y x)
            | otherwise = c
            
     union x y z | find x z == Nothing || find y z == Nothing = z
     union x y (TDS c r) = TDS (uniao x (TDS c r) ++ uniao y (TDS c r)) (delTDS x (delTDS y (TDS c r)))







