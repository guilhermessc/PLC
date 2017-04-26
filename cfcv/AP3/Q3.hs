data Arvbin = NilT | Node Int Arvbin Arvbin
    deriving Show 

-- Considerando que o nó do enunciado se refere a apenas um elemento. Dessa forma colocamos como primeiro argumento apenas Int e não Arvbin
-- Como o enunciado fala Sem repetições quando um elemento já existe ele para a recursão e retorna a arvoré original, ou seja, não insere
insertArvbin :: Int -> Arvbin -> Arvbin
insertArvbin a NilT = (Node a NilT NilT)
insertArvbin x (Node t l r) | (x == t) = (Node t l r)
                            | (x > t) = (Node t l (insertArvbin x r))
                            | otherwise = (Node t (insertArvbin x l) r) 

{-insertArvbin :: Arvbin -> Arvbin -> Arvbin
insertArvbin a NilT = a 
insertArvbin (Node a b c) (Node t l r) | (a == t) = (Node t l r)
                                       | (a > t) = (Node t l (insertArvbin (Node a b c) r))
                                       | otherwise = (Node t (insertArvbin (Node a b c) l) r) -}

-- Percorrendo a árvore em pro-ordem
arvList :: Arvbin -> [Int]
arvList NilT = []
arvList (Node t l r) = (arvList l)++(arvList r)++[t] 

-- Transforma a árvore em lista e soma todos os elementos
somaArv :: Arvbin -> Int 
somaArv x = foldl (+) 0 (arvList x)

-- Transforma uma lista em uma árvore
listArv :: [Int] -> Arvbin
listArv l = foldr (insertArvbin) NilT l    

-- Retorna o tamanho da árvore ,ou seja, o maior caminho da raiz até uma folha, por isso o uso da função max
maiorArv :: Arvbin -> Int 
maiorArv NilT = 0
maiorArv (Node x l r) = 1 + (max (maiorArv l) (maiorArv r))



-- Adicionar um numero que já existe na árvore?
