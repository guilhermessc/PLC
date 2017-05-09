data Expr = Literal Int -- um número
           | Soma Expr Expr -- soma as duas expressões 
           | Subtrai Expr Expr -- subtrai a segunda expressão da primeira
           | Variavel String -- representa uma variável, como ŭxŮ ou ŭyŮ
find :: String -> [(String, Int)] -> Int
find _ [] = 0
find y ((a,b):xs) | (y == a) = b
                  | otherwise = find y xs


avaliar :: [(String, Int)] -> Expr -> Int
avaliar l (Literal x) = x
avaliar l (Soma ex1 ex2) = (avaliar l ex1) + (avaliar l ex2)
avaliar l (Subtrai ex1 ex2) = (avaliar l ex1) - (avaliar l ex2)
avaliar l (Variavel x) = snd(head([(a,b) | (a,b) <- l, x==a])) 
--find x l

type Chave = [(Char,Char)]

rot13parcial :: Chave -- troca 'a' por ũnŪ, ũbŪ por ũoŪ, etc.
rot13parcial = [('a','n'),('b','o'),('c','p'),('d','q'),('e','r'),('f','s'),('g','t'),('h','u'),('i','v'),('j','w'),('k','x'),('l','y'),('m','z')]

func :: Chave -> Char -> Char
func [] y = y
func (x:xs) y | (y == (fst x)) = snd x 
              | otherwise = func xs y 

cipher :: Chave -> String -> String
cipher c [] = []
cipher c  (x:xs) = (func c x):cipher c xs 

inverteChave :: Chave -> Chave 
inverteChave [] = []
inverteChave (x:xs) = let a = fst x 
                          b = snd x 
                      in (b,a):(inverteChave xs)

type FuncaoChave = (Char -> Char)

chaveToFuncaoChave :: Chave -> Char -> Char
chaveToFuncaoChave [] c = c 
chaveToFuncaoChave (x:xs) c | (c == (fst x)) = snd x 
                            | otherwise = chaveToFuncaoChave xs c     

trocaSoLetraL :: FuncaoChave
trocaSoLetraL 'l' = 'b'
trocaSoLetraL c = c

cipherf :: FuncaoChave -> String -> String
cipherf = map 



data KeyTree = Empty | Node Char Char KeyTree KeyTree

chaveParcial :: KeyTree
chaveParcial = Node 'h' 'u' (Node 'c' 'p' (Node 'b' 'o' (Node 'a' 'n' Empty Empty) Empty) (Node 'e' 'r' Empty Empty)) (Node 'l' 'y' Empty (Node 'm' 'z' Empty Empty))

bin :: KeyTree -> Char -> Char 
bin (Empty) c = c 
bin (Node c1 c2 l r) carac | (carac == c1) = c2 
                           | (carac > c1) =  bin r carac 
                           | otherwise = bin l carac

cipherT :: KeyTree -> String -> String
cipherT g s = map (bin g) s 

--Exemplo: cipherT chaveParcial 'hello*hello' = 'uryyo*uryyo'

data Pilha1 t = Nul | Pilha1 t (Pilha1 t) 
      deriving Show

data Pilha2 t = Nulo | Pilha2 [t]
      deriving Show

push1 :: t -> Pilha1 t -> Pilha1 t
push1 x y = (Pilha1 x y)

pop1 :: Pilha1 t -> Pilha1 t 
pop1 (Nul) = (Nul)
pop1 (Pilha1 x y) = y

top1 :: Pilha1 t -> t  
top1 (Nul) = error "er"
top1 (Pilha1 x y) =  Just x

push2 :: t -> Pilha2 t -> Pilha2 t
push2 x (Nulo) = (Pilha2 [x])
push2 x (Pilha2 l) = (Pilha2 (x:l))

pop2 :: Pilha2 t -> Pilha2 t
pop2 (Nulo) = (Nulo)
pop2 (Pilha2 (x:xs)) = (Pilha2 xs)

top2 :: Pilha2 t -> t
top2 (Nulo) = error "er"
top2 (Pilha2 (x:xs)) =  x 