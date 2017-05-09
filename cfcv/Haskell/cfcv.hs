del :: String -> [Char]
del [] = []
del (x:xs) = xs

-- duplica os elementos de uma lista de inteiros
double :: [Int] -> [Int]
double [] = []
double (x:xs) = [x]++[x]++double xs

--Verifica se um elemento especifico esta presente na lista
member :: [Int] -> Int -> Bool
member [] _ = False
member (x:xs) a | (x == a) = True
                | otherwise = member xs a

-- verify if the character is a number
isNumber :: Char -> Bool
isNumber ch | (ch >= '0' && ch <= '9') = True
            | otherwise = False

-- retorna os numeros de uma string
digits :: String -> String
digits [] = []
digits (x:xs) | (isNumber x) = [x]++digits xs
              | otherwise = digits xs

-- soma todos os pares de tuplas
sumPair :: [(Int, Int)] -> [Int]
sumPair [] = []
sumPair ((x,y):xs) = [x+y]++sumPair xs

-- soma todos os elementos de uma lista de inteiros
sumList :: [Int] -> Int
sumList [] = 0;
sumList (x:xs) = x + sumList xs

-- Função decrescente
func :: Int -> Int 
func n = -n

-- Função que recebe parâmetro de uma função e verifica se ela é crescente
isCrescent :: (Int -> Int) -> Int -> Bool
isCrescent f 0 = True
isCrescent f n | ((f n) >= (f (n-1))) = True && isCrescent f (n-1)
               | otherwise = False 



