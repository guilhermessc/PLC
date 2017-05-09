data LDisjointSet = LDS [[Int]] 
   deriving (Eq,Show)

data TDisjointSet = Void | TDS [Int] TDisjointSet 
   deriving (Eq, Show)

--Função que retorna True se o elemento pertence a lista e false caso contrário
findList :: Int -> [Int] -> Bool
findList _ [] = False
findList n (x:xs) | (n == x) = True
                  | otherwise = findList n xs

-- Função que deleta uma lista em uma estrutura LDS
delete :: Maybe Int -> [[Int]] -> [[Int]]
delete r (x:xs)  | (r == Just(head x)) = xs
                 | otherwise = x:(delete r xs)

-- Função que retorna uma lista(conjunto) de uma estrutura LDS
extract :: Maybe Int -> [[Int]] -> [Int]
extract _ [] = []
extract r (x:xs) | (r == Just (head x)) = x
                 | otherwise = extract r xs

-- Função que retorna uma lista(conjunto) dado o representante desse conjunto na estrutura TDS
extract_tds :: Maybe Int -> TDisjointSet -> [Int]
extract_tds _ Void = []
extract_tds r (TDS l xl) | (r == Just (head l)) = l
                         | otherwise = extract_tds r xl

-- Função que deleta um conjunto dado seu representante na estrutura TDS
delete_tds :: Maybe Int -> TDisjointSet -> TDisjointSet
delete_tds _ Void = Void
delete_tds r (TDS l xl) | (r == Just (head l)) = xl
                        | otherwise = (TDS l (delete_tds r xl))
-- Classe de funções
class OprDisjointSet t where
    find :: Int -> t -> Maybe Int
    makeSet :: Int -> t -> t
    union :: Int -> Int -> t -> t

-- Funções para LDS
instance OprDisjointSet LDisjointSet where
    find n (LDS []) = Nothing
    find n (LDS (x:xs)) | ((findList n x) == True) = Just (head x)
                        | otherwise = find n (LDS xs)  
    
    makeSet n (LDS l) | ((find n (LDS l)) /= Nothing) = (LDS l)
                      | otherwise = (LDS (l++[[n]]))

-- Caso a e b não estejam presentes na lista ele retorna a estrutura sem alteração, caso contrário ele estrai as duas e concatena entre si e por fim concatena com a lista sem os dois conjuntos originais
    union a b (LDS l) = let r1 = (find a (LDS l)) 
                            r2 = (find b (LDS l))
                        in if(r1 == Nothing || r2 == Nothing || r2 == r1) then (LDS l) else (LDS ([(extract r1 l)++(extract r2 l)]++(delete r1 (delete r2 l))))

-- Funções para TDS
instance OprDisjointSet TDisjointSet where
    find n Void = Nothing
    find n (TDS l xl) | (findList n l) = Just (head l)
                      | otherwise = find n xl  
    
    makeSet n (TDS l xl) | ((find n (TDS l Void)) == Nothing && (find n xl) == Nothing) = (TDS [n] (TDS l xl))
                         | otherwise = (TDS l xl)
                            
-- Mesmo raciocínio da union para LDS
    union a b (TDS l xl) = let r1 = (find a (TDS l xl)) 
                               r2 = (find b (TDS l xl))
                        in if(r1 == Nothing || r2 == Nothing) then (TDS l xl) else (TDS ((extract_tds r1 (TDS l xl))++(extract_tds r2 (TDS l xl))) (delete_tds r1 (delete_tds r2 (TDS l xl))))
