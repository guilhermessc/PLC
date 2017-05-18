finde :: Int->[[Int]]->[[Int]]
finde y [] = []  --posso retornar só o "x"?
finde y (h:t) |([x |x<-h,x==y] == []) = (finde y t)
              | otherwise = [h] ++ (find y t)

makeSet ::  Int->[[Int]]->[[Int]]
makeSet y (z) |((finde y (z)) == []) =(z) ++  [[y]] 
              | otherwise = (z)

union :: Int->[[Int]]->[[Int]]
union y [] = [[]]
union y (h:t) |([x |x<-h,x==y] == []) = (union y t)
              |otherwise = [h] ++ (union y t) 

uniao :: Int->Int->[[Int]]->[[Int]]
uniao x y (z) = (union x z) ++ (union y z)