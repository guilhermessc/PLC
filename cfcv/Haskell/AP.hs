type Ponto = (Float, Float, Float)

distancia :: Ponto -> Ponto -> Float
distancia (a,b,c) (x,y,z) = sqrt((a-x)^2+(b-y)^2+(c-z)^2)

type Nome = String
type Tamanho = Int


data Diretorio = Arquivo Nome Tamanho | Pasta Nome [Diretorio] 	     
   deriving Show

sizeTam :: Diretorio -> Int
sizeTam (Pasta n []) = 0
sizeTam (Pasta n (x:xs)) = sizeTam x + sizeTam (Pasta n xs)
sizeTam (Arquivo n len) = len

sizeNum :: Diretorio -> Int 
sizeNum (Pasta n []) = 0
sizeNum (Pasta n (x:xs)) = sizeNum x + sizeNum (Pasta n xs) 
sizeNum (Arquivo n len) = 1

size :: Diretorio -> (Int, Int)
size n = (sizeTam n, sizeNum n)
--data Arv = NilT | Arv (Diretorio) (Diretorio) 

data Complex = Im Float Float

instance Show Complex where
 show (Im a b) | b < 0 = (show a)++" "++"-j"++(show (b*(-1)))
               | otherwise = (show a)++" j"++(show b)