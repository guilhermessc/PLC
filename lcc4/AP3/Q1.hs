data Complexo = Im Float Float
instance Show Complexo where
        show(Im a b)  | b<0 = show(a) ++ show(b) ++ ".i"
                      |otherwise = show(a) ++ "+" ++ show(b) ++ ".i"

instance  Add Complexo where
	(==) (Im x y) (Im k l) = (x==k) && (l==y)
	(/=)(Im x y) (Im k l) = (x/=k) || (l/=y)
	(+) (Im x y) (Im k l) = (Im(x+k)(y+l))
    (-) (Im x y) (Im k l) = (Im(x+k)(y-l))
    (*) (Im x y) (Im k l) = (Im(x*k-y*l)(x*l+y*k))
    negate (Im x y) = (Im (-x) (-y))
    abs (Im x y) = (Im (sqrt(x^2+y^2)) 0)
    signum (Im x y ) = (Im (sqrt(x^2 + y^2)) 0)
    fromInteger Int x = (Im (x) (0)) 



