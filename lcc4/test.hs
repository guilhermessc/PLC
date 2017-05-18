import Data.Char

answer :: Int
answer = 42

yes :: Bool
yes = True

square :: Int -> Int
square x = x*x

allEqual :: Int->Int->Int->Bool
allEqual n m p = (n==m) && (m==p)

all4Equal :: Int->Int->Int->Int->Bool
all4Equal n m p q = allEqual n m p && n == q

sumSquares :: Int->Int->Int
sumSquares x y = sq x + sq y  
   where sq z = z*z

maxi ::  Int->Int->Int
maxi n m | n>m   =n
         | n == m = error "valores sao iguais"
         | otherwise = m

vendas :: Int -> Int
vendas 0 = 10
vendas n = n+5

totalVendas :: Int->Int
totalVendas 0 = vendas 0
totalVendas n = totalVendas (n-1) + vendas n

maxVendas :: Int->Int
maxVendas 0 = vendas 0
maxVendas n = maxi (vendas n )(vendas n-1)

vendasNulas :: Int->Bool
vendasNulas n = vendas n == 0

printVendas :: Int->String
printVendas n = show(n) ++ show(vendas(n))

{-tablePrint :: Int->String
tablePrint 0 = printVendas 
tablePrint n = printVendas -}

{-table :: Int->String
table n = "Semana " ++ "Venda" ++ tablePrint n-}

--not or and

myNot :: Bool->Bool
myNot False = True
myNot True = False

myOr :: Bool->Bool->Bool
myOr False False = False
myOr m n = True 

exOr :: Bool->Bool->Bool
exOr True n = not n
exOr False n = n

myAnd :: Bool->Bool->Bool
myAnd True True = True
myAnd m n = False

fat :: Integer->Integer
fat 0 = 1
fat n = fat(n-1) * n

igual :: Int->Int->Int->Int->Bool
igual a b c d = allEqual a b c && (a == d)  

--counti :: Int->Int->Int->Int ainda preciso implementar

addEspacos :: Int->String
addEspacos 0 = " "
addEspacos n = " " ++ addEspacos(n-1)
-- porque o exmplo acima só funciona se o n-1 estiver em parenteses?

praDireita :: String -> Int -> String
praDireita n a = addEspacos a ++ n 

mulPair :: (Int,Int) -> Int
mulPair (l,n) = l*n

sumList :: [Int]->Int
sumList [] = 0
sumList (head:tail) = head + sumList tail

double :: [Int]->[Int]
double [] = []
double (h:t) = (h*2):(double t)

member :: [Int]->Int->Bool
member (h:t) a = a == h ||  member t a
member [] a = False

digits :: String->String
digits [] = []
digits (h:t) | (h>='0' && h<='9') = [h] ++ digits t
             | otherwise = digits t

sumPair :: [(Int,Int)]->[Int]
sumPair [] = []
sumPair ((x,y):r) = [x+y] ++ sumPair r

type Pessoa = String
type Livro = String
type BancoDados = [(Pessoa,Livro)]

livros :: BancoDados->Pessoa->[Livro]
livros [] a = []
livros ((p,l):t) a | a==p = [l] ++ livros t a
                   |otherwise = livros t a

membro :: [Int] -> Int -> Bool
membro xs y = [ x| x<-xs , x==y] /= []

livvros :: BancoDados -> Pessoa -> [Livro]
livvros bd p = [livro | (pessoa,livro) <- bd, pessoa == p ]

emprestimos :: BancoDados -> Livro -> [Pessoa]
emprestimos bd l = [pessoa | (pessoa,livro) <- bd, livro == l]

emprestado :: BancoDados -> Livro -> Bool
emprestado bd l = emprestimos bd l /=[]
-- [ | (pessoa,livro) <- bd, livro == l]
{-
palindromo :: [Int]->Bool
palindromo [] = True
palindromo [_] = True
palindromo (head:tail) | head == last(tail) = palindromo tail
                       | otherwise = False -}                     

listMul :: [Int]->[Int]
listMul (a) = [x*10 | x <- (a)]


{-reduz1 :: [Int]->[Int]
reduz1 (a) = [x | x<-(a),y<-(a),x==y &&]

-}

sqList :: [Int]->[Int]
sqList h = map square h

{-
sqSum :: ((Int->Int)->[Int]->[Int])
sqSum f h = -}


--quick sort
ordenaPeso :: (a->Int)->[a]->[a]
ordenaPeso f [] = []
ordenaPeso f (h:t) = ordenaPeso f [x | x<-(t), (f h) >= (f x)] ++ [h] ++ ordenaPeso f [x | x<-(t), (f h) < (f x)]
 
miAnd :: [Bool]->Bool
miAnd a = foldr (&&) True a
{-FAZER OS OUTROS-}


miOR :: [Bool]->Bool
miOR a = foldr (||) False a 
--Nao esta funcionando direito

classificar :: String -> String
classificar h = map toUpper (filter (\x ->  x<'0' || x>'9') h) ++ filter (\x -> x>='0' && x<='9') h



type Ponto = (Float,Float,Float)


distancia :: Ponto->Ponto->Float
distancia(x,y,z) (k,l,m) = sqrt((x-k)^2+(y-l)^2+(z-m)^2)


type Nome = String
type Tamanho = Int

data Diretorio = Arquivo Nome Tamanho | Pasta Nome [Diretorio]
    --deriving show
--calculo a quantidade de pastas ou arquivos primeiro?
{--
dirTam :: Diretorio->Int
size (Pasta x []) = 1
size (Pasta x y) = 1 + size(y) 

dirSize :: Diretorio->Int
size (Arquivo x y) = y

dirPastaArq :: Diretorio->(x,y)
dirPastaArq = | Pasta x y = (dirTam(Pasta x y) + dirPastaArq(y),1)
              | otherwise = (size(Arquivo k l),1) --}




data Complexo = Im Float Float
instance Show Complexo where
        show(Im a b)  | b<0 = show(a) ++ show(b) ++ ".i"
                      |otherwise = show(a) ++ "+" ++ show(b) ++ ".i"
