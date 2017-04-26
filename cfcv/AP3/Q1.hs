data Complex = Img Float Float
    deriving Show

instance Eq Complex where
    (==) (Img a b) (Img c d) = ((a == c)&&(b==d))  
    (/=) a b = not (a==b)

instance Num Complex where
    (+) (Img a b) (Img c d) = (Img (a+c) (b+d))
    (-) (Img a b) (Img c d) = (Img (a-c) (b-d))
    (*)	(Img a b) (Img c d) = (Img ((a*c) - (d*b)) ((c*b)+(a*d)))
    negate (Img a b) = (Img (-a) (-b))
    abs (Img a b) = (Img (sqrt(a^2 + b^2)) 0) 
    signum (Img a b) = (Img (atan(b/a)) 0.0)
    fromInteger a = (Img (fromIntegral a) 0.0)
