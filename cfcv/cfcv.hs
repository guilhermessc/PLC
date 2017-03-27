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

-- Banco de Dados
type Pessoa = String
type Livro = String
type Banco = [(Pessoa, Livro)]

-- banco de dados em si
exemplo :: Banco
exemplo = [("carlos", "circuitos"), ("carlos", "shell script"), ("guilherme", "A arte de ser homossexual"),("brayner", "como invadir um pc")]

-- Consulta os livros de cada pessoa no banco de dados
livros :: Banco -> Pessoa -> [Livro]
livros [] _ = []
livros ((p,l):xs) people | (p == people) = [l]++livros xs people
                         | otherwise = livros xs people   
