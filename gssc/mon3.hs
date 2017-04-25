type Ponto = (Float, Float, Float)

distancia :: Ponto -> Ponto -> Float
distancia (a, b, c) (x, y, z) = sqrt ((a-x)^2 + (b-y)^2 + (c-z)^2)

type Nome = String
type Tamanho = Int
data Diretorio = Arquivo Nome Tamanho | Pasta Nome [Diretorio]
     deriving Show

dir_size :: Diretorio -> (Int, Int)
dir_size (Pasta n []) = (0,0)
dir_size (Arquivo n t) = (t,1)
dir_size (Pasta n (a:as)) = dir_sum (dir_size a) (dir_size (Pasta n as))
     where dir_sum (a,b) (x,y) = (a+x, b+y)

data Complex = Im Float Float

instance Show Complex where
      show (Im a b) | b /= 0 = (show a) ++ " " ++ (show b) ++ "i\n"
                    | otherwise = (show a)

instance Num Complex where
      (+) (Im a b) (Im x y) = (Im (a+x) (b+y))
      (-) (Im a b) (Im x y) = (Im (a-x) (b-y))
      (*) (Im a b) (Im x y) = (Im (a*x - b*y) (b*x + a*y))
      negate (Im a b) = (Im (-a) (-b))
      abs (Im a b) = (Im (sqrt(a^2 + b^2)) 0)
      signum (Im a b) = (Im (atan(b/a)) 0)
      fromInteger a = (Im (fromInteger a) 0)

instance Eq Complex where
	  (==) (Im a b) (Im x y) = (a == x) && (b == y)
	  (/=) (Im a b) (Im x y) = (a /= x) || (b /= y)
