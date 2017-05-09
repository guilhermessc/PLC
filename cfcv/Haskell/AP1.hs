----------------------------------------------- Q1 -----------------------------------------------

-- Função de ordenação
qsort :: [Int] -> [Int]
qsort [] = []
qsort (x:l) = qsort [k | k <- l, k<x] ++ [x] ++ qsort [k | k <- l, k>=x]

-- Função principal
reduz1 :: [Int] -> [Int]
reduz1 l = let conjunto = qsort l in 
 [conjunto!!i| i <- [0..(length conjunto -2)], (conjunto!!(i+1)) == conjunto!!i]


----------------------------------------------- Q2 -----------------------------------------------

-- Função de ordenação
qsort_Q2 :: [Int] -> [Int]
qsort_Q2 [] = []
qsort_Q2 (x:xs) = qsort_Q2[y | y <- xs, y < x] ++ [y | y <- (x:xs),y == x] ++ qsort_Q2 [y | y <- xs, y > x]

-- Conta a quantidade que um elemento aparece na lista
count :: Int -> [Int] -> Int
count _ [] = 0
count e (x:xs) | (e==x) = 1 + count e xs
               | otherwise = count e xs

-- exclui um elemento da lista
exclui :: Int -> [Int] -> [Int]
exclui _ [] = []
exclui e (x:xs) | (e==x) = exclui e xs
                | otherwise = [x]++exclui e xs

tpq_aux :: [Int] -> [(Int, Int)]
tpq_aux [] = []
tpq_aux (x:xs) = [(x,count x (x:xs))]++tpq_aux (exclui x xs)

tuplaQuant :: [Int] -> [(Int, Int)]
tuplaQuant l = tpq_aux (qsort_Q2 l)


----------------------------------------------- Q3 -----------------------------------------------

-- Função que retorna o tamanho da lista
len :: [Int] -> Int
len [] = 0
len (x:xs) = 1 + len xs

-- Gera o array booleano
gera_bool :: Int -> [Bool]
gera_bool 0 = []
gera_bool n | (mod n 2 == 0) = [False]++gera_bool (div n 2)
            | otherwise = [True]++gera_bool (div n 2)

-- Percorre a lista inteira, caso o elemento esteja marcado como False ele é excluido
percorre :: [Bool] -> [Int] -> [Int]
percorre [] _ = []
percorre _ [] = []
percorre (b:bs) (x:xs) | (b == True) = [x]++percorre bs xs
                       | otherwise = percorre bs xs

-- Executa a operação de percorrer a lista para N vezes
comb :: Int -> [Int] -> [[Int]]
comb 0 _ = []
comb n (x:xs) = [percorre (gera_bool n) (x:xs)]++comb (n-1) (x:xs)

combinacoes :: [Int] -> [[Int]]
combinacoes [] = []
combinacoes lst =  comb (2^(len lst)) lst

-- Geramos um número na base 2^n sendo n o tamanho da lista, a partir desses números
-- geramos o array booleano e cada número 1, 2, 3 ... 2^n representará um caso de combinação