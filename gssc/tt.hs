answer :: Int
answer = 42

maxi :: Int->Int->Int
maxi a b | (a > b) = a
         | otherwise = b

all_equal :: Int->Int->Int->Bool
all_equal a b c = (a == b && a == c)

vendas :: Int->Int
vendas a | (a == 0) = 10
         | otherwise = a*10

todas_vendas :: Int->Int
todas_vendas a | a == 0 = vendas 0
               | otherwise = todas_vendas (a-1) + vendas a

fibo :: Int->Int
fibo 1 = 0
fibo 2 = 1
fibo n = fibo (n-1) + fibo(n-2)

erro :: Int -- foda-se txio
erro = error "foda-se carlos"

lala :: Int->Int
lala 2 = 10
lala n = n

fat :: Integer->Integer
fat 0 = 1
fat n = fat (n-1) * n

all4equal :: Int->Int->Int->Int->Bool
all4equal e s d f = (all_equal e s f && (e == d))

sumSquares :: Int -> Int -> Int
sumSquares x y = sqX + sq y
               where sqX = x*x
                     sq z = z*z

addSpc :: Int->String
addSpc a | a == 0 = ""
         | a < 0 = error "deu ruim\n"
         | otherwise = " " ++ addSpc(a-1)

toTheRight :: String->Int->String
toTheRight str a = addSpc(a) ++ str

sumList :: [Int]->Int
sumList [] = 0
sumList (a:as) = a + sumList as

mirror :: [t] -> [t]
mirror [] = []
mirror (a:as) = (a:(mirror(as)))++[a]

checkList :: Int->[Int]->Bool
checkList a [] = False
checkList n (a:b) = ((a == n) || (checkList n b))

type Pessoa = String
type Livro = String
type Banco_de_dados = [(Pessoa, Livro)]

bdd_ex :: Pessoa->Banco_de_dados->[Livro]
bdd_ex n [] = []
bdd_ex x (a:b) | x == fst a = snd a : (bdd_ex x b)
               | otherwise = (bdd_ex x b)

euclides :: Integer -> Integer -> Integer
euclides x y | mod x y == 0 = y
             | otherwise = euclides y (mod x y)

divisao_euclidiana :: Integer -> Integer -> (Integer, Integer)
divisao_euclidiana a b | a >= b = ( div a (euclides a b), div b (euclides a b))
                       | otherwise = (div a (euclides b a), div b (euclides b a))

palindromo :: String -> Bool
palindromo a = reverse a == a

qSort :: [Integer] -> [Integer]
qSort [] = []
qSort (a:as) = qSort [x | x <- as, a > x] ++ [a] ++ qSort [x | x <- as, a < x]