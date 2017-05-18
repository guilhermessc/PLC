quickSort :: [Int]->[Int]
quickSort [] = []
quickSort (h:t) = quickSort [x | x<-(h:t), x<h] ++ [x | x<-(h:t), x==h] ++ quickSort[x | x<-(h:t), x>h]
--quickSort (h:t) = [x | x<-(h:t), x<h] ++ [h] ++ [x | x<-(h:t),x>h]

nub :: [Int]->[Int]
nub [] = []
nub (h:t) =  [h] ++ nub[y | y<-t , y/=h]
--nice

-- recebe uma lista ordenada e separa em listas de mesmo numero
separeLists :: [Int]->[[Int]]
separeLists [] = [[]]
separeLists (h:t) =  [[x |x<-(h:t), x == h]] ++ separeLists[x |x<-(h:t), x /= h]

takeOne :: [[Int]]->[Int]
takeOne [[]] = []
takeOne ((h:xs):t)   | (xs /= []) = [x | x<-xs] ++ takeOne t
                     | otherwise = [h] ++ takeOne t

subNub :: [Int]->[Int]
subNub [] = []
subNub z = takeOne ( (.) separeLists quickSort z)

myConcat :: Eq a => [[a]]->[a]
myConcat [[]] = []
myConcat (h:t) = [x | x<-h] ++ myConcat t

myAnd :: (Int->Bool)->[Int]->Bool
myAnd _ [] = True
myAnd f (h:xs) | f h == True = myAnd f xs
               |otherwise = False
--(7/2 = 7-2, 5-2, 3-2
divisaoEuclidiana :: Int -> Int -> (Int,Int)
divisaoEuclidiana 0 _ = (0,0)
divisaoEuclidiana x y | ((x-y) < 0) = (0,x)
                      | otherwise = sumTuples (1,0) (divisaoEuclidiana (x-y) y )

sumTuples :: (Int,Int) -> (Int,Int) -> (Int,Int)
sumTuples (x,y) (z,w) = (x+z,y+w)


ePrimo :: Int -> Int -> Bool
ePrimo _ 1 = True
ePrimo x y | (mod x y == 0) = False
           | otherwise = ePrimo x (y-1)

qualPrimo :: Int -> Int -> Int -> Int
qualPrimo n y x | y == n = x-1
                | (ePrimo x (x-1)) == False =  qualPrimo n y (x+1)
                | otherwise = qualPrimo n (y+1) (x+1)

nPrimo :: Int->Int
nPrimo n = qualPrimo n 0 2

walk :: Int -> Int-> [Int] -> [Int]
walk _ _ [] = []
walk n  y (h:t) | n /= h = walk n (y+1) t
                 | otherwise = [y] ++ walk n (y+1) t

index :: Int->[Int]->[Int]
index x g = walk x 1 g



count :: Int->[Int]->Int
count _ [] = 0
count x (h:t) | x==h = 1 + count x t
              | otherwise = count x t

check :: Int -> [Int]->Bool
check _ [] = False
check x (h:t) | x == h = True
              | otherwise = check x t

--x = elem inicial, y = suposto elemento final, k = passo
fromTo :: Int -> Int -> Int ->[Int]
fromTo x y k | abs(x-y) <  abs k = [x]  
             | otherwise = [x] ++ fromTo (x+k) y k


baixa:: [(String, Int, Int)] -> Int -> [(String, Int, Int)]
baixa [] _ = []
baixa ((n,x,y):t) a | (x < a) = [(n,x,y)] ++ baixa t a
                    | otherwise = baixa t a

apurado :: [(String, Int, Int)] -> Int -> (Int, Int)
apurado [] _ = (0,0)
apurado ((n,x,y):t) a | (x<a) = sumTuples (1,y) (apurado t a)
                      | otherwise = apurado t a

geraTuplas :: Int->Int->[(Int,Int)]
geraTuplas n 0 = [(0,n)] ++ [(n,0)] 
geraTuplas n x = (geraTuplas n (x-1)) ++ [(x,n)] ++ [(n,x)]

criaDominio :: Int -> [(Int,Int)]
criaDominio 0 = (0,0):[]
criaDominio n = (criaDominio (n-1)) ++ [(y,x) | (x,y)<-(geraTuplas n n),x>y]
--fazer quicksort de tuplas usando compreensão

--ordenaPeso f a = map counterF(quicksort (map f a))

palindrome :: Eq a =>[a] -> Bool
palindrome [] = True
palindrome (h:t) | h == last t = palindrome (init t)
                 | otherwise = False 

reduz1 :: [Int]->[Int]
reduz1 [] = []
reduz1 (h:t) =reduz1[x | x<-(h:t), x<h] ++ init [x | x<-(h:t), x==h] ++ reduz1 [x | x<-(h:t), x>h]

tuplaQuant :: [Int] -> [(Int, Int)]
tuplaQuant [] = []
tuplaQuant (h:t) = tuplaQuant[x | x<-(h:t), x<h] ++ [(h, length [x | x<-(h:t), x==h])] ++ tuplaQuant[x | x<-(h:t), x>h]

-- fold na lista de funções
aplicaFuncoes :: [a->a] -> [a] -> [a]
aplicaFuncoes [] l = l
aplicaFuncoes (h:t) l = aplicaFuncoes t (map h l) 


(>.>) :: (Int->Int)->(Int->Int)->(Int->Int)
(>.>) f g= (.) g f


fAnd :: Bool->Bool->Bool
fAnd a b = foldr (\y acc -> acc && y) True [a,b]

fOr :: Bool->Bool->Bool
fOr a b = foldr (\y acc -> acc || y) False [a,b]

fConcat :: [[a]]->[a]
fConcat [] = []
fConcat (h:t) = h ++ fConcat t

fSum :: Num a=> [a]-> a
fSum a = foldl (\acc y -> acc + y) 0 a
 
classificar :: String->String
classificar [] = []
classificar l = (filter (\x -> 'x'<'0' || x>'9') l) ++ (filter (\x -> x>='0' && x<='9') l)
 

seqCollatz :: Int -> Int
seqCollatz 1 = 1

seqCollatz x | (mod x 2) == 0 = 1 + (seqCollatz (div x 2)) 
             | otherwise = 1 + seqCollatz (3*x+1)

maiorSeqCollatz :: [Int] -> Int
maiorSeqCollatz x = foldl (\acc y -> if acc<y then y else acc) 0 (map seqCollatz (filter (>0) x))



type Ponto = (Float,Float,Float)

maiorDist :: Ponto->Ponto->Float
maiorDist (x,y,z) (k,l,m) = sqrt((x-k)^2+(y-l)^2+(z-m)^2)

type Nome = String
type Tamanho = Int

data Diretorio = Pasta Nome [Diretorio] | Arquivo Nome Tamanho

size :: Diretorio -> (Tamanho, Int) --tamanho e o número de arquivos
size (Arquivo _ y) = (y,1)
size (Pasta _ (h:t)) = foldl sumTuples (0,0) (map (size) (h:t))

data Arvore a = Empty | Folha a (Arvore a) (Arvore a) deriving (Show)

freeTree :: Arvore Int  
freeTree = Folha 10 (Folha 9 (Folha 7 Empty Empty) Empty) (Folha 12 Empty Empty)

valArvore :: Arvore Int -> Int
valArvore Empty = 0
valArvore (Folha a x y) = a + valArvore x + valArvore y

arvLista :: Arvore Int -> [Int]
arvLista Empty = [-1]
arvLista (Folha a x y) = arvLista x ++ [a] ++ arvLista y
-- lista em ordem

listaArv :: [Int] -> Arvore Int
listaArv [] = Empty
listaArv (x:xs) | x < head xs = (Folha   x (listaArv xs) Empty)
                | otherwise = (Folha x Empty (listaArv xs))

insertTree :: Int -> Arvore Int -> Arvore Int 
insertTree x Empty = (Folha x Empty Empty)
insertTree x (Folha a l r)   | x > a  =  (Folha a l (insertTree x r))   
                             | otherwise = (Folha a (insertTree x l) r)

alturaArv :: Arvore Int -> Int
alturaArv Empty = 1
alturaArv (Folha x y z) = 1 + alturaArv y 


data Expr = Literal Int | Soma Expr Expr | Subtrai Expr Expr | Variavel String 


-- fazer um map dos valores

tradutor :: String -> [(String,Int)]->Int
tradutor x ((h,n):t) | x == h = n
                     | otherwise = tradutor x t
avaliar :: [(String,Int)] -> Expr -> Int
avaliar l (Literal x) = x
avaliar l (Soma x y) = (avaliar l x ) + (avaliar l y )
avaliar l (Subtrai x y) = (avaliar l  x ) - (avaliar l  y )
avaliar l (Variavel x) = tradutor x l






type Chave = [(Char, Char)]

rot13parcial :: Chave 
rot13parcial = [('a', 'n'), ('b', 'o'), ('c', 'p'), ('d', 'q'), ('e', 'r'), ('f', 's'),('g', 't'), ('h', 'u'), ('i', 'v'), ('j', 'w'), ('k', 'x'), ('l', 'y'), ('m', 'z')]


traduz :: Chave ->Char->Char
traduz  key x = snd (head (filter (\(y,k) -> x == y) key))


traduz1 :: Chave ->Char->Char
traduz1 key x  |  (filter (\(y,k) -> x == y) key) /= [] = snd (head (filter (\(y,k) -> x == y) key))
               | otherwise =  x 

cipher :: Chave -> String -> String
cipher chave g = map (traduz1 chave) g  

traduz2 :: Chave ->Char->Char
traduz2 key x  |  (filter (\(y,k) -> x == k) key) /= [] = fst (head (filter (\(y,k) -> x == k) key))
               | otherwise =  x

decipher :: Chave -> String -> String
decipher chave g = map (traduz2 chave) g 


data Pilha2 t = Void | Casa t [Pilha2 t] deriving Show

data Pilha1 t = Null | Elem t (Pilha1 t) deriving Show

pop1 :: Pilha1 Int -> Pilha1 Int
pop1 Null = Null
pop1 (Elem t y) = y

top1 :: Pilha1 Int -> Int
top1 Null = error "A pilha esta vazia"
top1 (Elem x y) = x

push1 :: Int -> Pilha1 Int -> Pilha1 Int
push1 x y = (Elem x y)


number :: Int -> [Int] ->[Int]
number _ [] = [] 
number x (h:t) | x == h = [h] ++ number x t
               | otherwise = number x t

f :: [Int]->[Int]
f [] = []
f (h:t) = (number h t) ++ f (filter (\x -> x /= h) (h:t))

f1 :: [Int]->[Int]
f1 (h:t) = [x |x<-t,x==h] 

isPar :: Int->Bool
isPar x | mod x 2 == 0 = True
        | otherwise = False

g :: [Int] -> Bool
g l =  foldl (\acc y -> acc && y) True (map isPar (filter (\x -> x<100) l))


type Potencia = Int

data Lampada = Compacta Nome Potencia | Incandecente Nome Potencia

instance Show Lampada where
    show (Compacta x y) = "Compacta" ++ show x ++ show y
    show (Incandecente x y )= "Incandecente"++ show x ++ show y



instance  Eq Lampada where
    (==) (Compacta x y) (Compacta l k) =  (x==l) && (y == k)
    (==) (Incandecente x y) (Incandecente l k) =  (x==l) && (y == k)
    (==)  _ _ = False