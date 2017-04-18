data Expr = Lit Int 
           | Add Expr Expr 
           | Sub Expr Expr
      deriving Show

data List t = Nil | Cons t (List t)
      deriving Show 

data Tree t = NilT | Node t (Tree t) (Tree t)
      deriving Show 

showExpr :: Expr -> String
showExpr (Lit x) = show x
showExpr (Add e1 e2) = "("++showExpr e1++"+"++showExpr e2++")"
showExpr (Sub e1 e2) = "("++showExpr e1++"-"++showExpr e2++")"

toList :: List t -> [t]
toList Nil = []
toList (Cons x xs) = [x]++toList xs

fromList :: [t] -> List t
fromList [] = Nil
fromList (x:xs) =  Cons x (fromList xs) 

depth :: Tree t -> Int
depth NilT = 0
depth (Node n l r) = if(x > y) then 1+x else 1+y
                     where x = depth l 
                           y = depth r 

collapse :: Tree t -> [t]
collapse NilT = []
collapse (Node n l r) = (collapse l)++(collapse r)++[n]

mul2 :: Int -> Int
mul2 x = 2*x

mapTree :: (t->u) -> Tree t -> Tree u
mapTree f NilT = NilT
mapTree f (Node n l r) = (Node (f n) (mapTree f l) (mapTree f r))