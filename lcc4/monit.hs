{-
f:: 
f = map (+)

map :: (a -> b) -> [a] -> [b]
(+) :: a -> a -> a


(a->b) = a->a->a
a = a 
b = a->a
O tipo de f é igual ao retorno de map (+0
logo:
map :: (a->b)->[a]->[a->a]
f :: [a]->[a->a]
-}
{-

(.) :: (b -> c) -> (a -> b) -> a -> c
map :: (d->e)->[d]->[e]
map :: (f->g)->[f]->[g]

(b->c) = (d->e)->[d]->[e]
b = d->e
c = [d]->[e]

(a -> b) = (f->g)->[f]->[g]
a = (f->g)
b = [f]->[g]
d->e = [f]->[g]
logo
d = [f]
e = [g]
basta aplicar os resultados em (.)
-}

f :: [Int]->[Int->Int]
f = map (+)

--map (soma3 4 5) [1..10]
-- a aplicação desse conceito reside no fato de querermos aplicar uma função com dois elementeos fixos por exemplo, e um terceiro variando



{-
data Expr = Literal Int -- um número
            | Soma Expr Expr -- soma as duas expressões
            | Subtrai Expr Expr -- subtrai a segunda expressão da primeira
            | Variavel String -- representa uma variável, como ŭxŮ ou ŭyŮ



avaliar :: [(String,Int)]->Expr->Int
avaliar l (Literal k) = k
avaliar l (Soma a b) = (avaliar l a) + (avaliar l b)
avaliar l (Subtrai a b) = (avaliar l a) - (avaliar l b)
avaliar l (Variavel c) = find l c

find :: [(String,Int)]->String->Int
find ((a,b)) c = head [(_,x)| x<-((a,b)),a==c]--erro esta no retorno dessa tupla, vejo isso mais tarde  -}


{- Map, Filter  -}
{-}
type Chave = [(Char, Char)]

rot13parcial :: Chave -- troca 'a' por ũnŪ, ũbŪ por ũoŪ, etc.
rot13parcial = [('a', 'n'), ('b', 'o'), ('c', 'p'), ('d', 'q'), ('e', 'r'), ('f', 's'),
('g', 't'), ('h', 'u'), ('i', 'v'), ('j', 'w'), ('k', 'x'), ('l', 'y'), ('m', 'z')]

sub1 :: Chave->Char->Char
find [] a = a
find ((b,c):xs) a | b == a = c
                  | c == a = b
                  | otherwise = find xs a

 cipher :: Chave->String->String
 cipher a [] = ""
 cipher g (x:xs) | (sub1 g x) : (sub1 g xs)

cipherf ::(Char->Char)->String->String
cipherf trocaSoLetra (h:t) = (trocaSoLetra h) ++ (cipherf trocaSoLetra t)
 -- muit mais facil map trocaSoLetra (h:t)((
 (((f a)b)c)

(+)a b
(+) a ->(b->c)

1 + b -> c

soma3 :: Int->Int->Int->Int
soma3 a b c = a + b + c

(((soma3 a)b)c) = a + soma3(b)
= soma3 b c = val(a) + b + c
a fica com valor fixo, mas b e c com valores variáveis
a função deixa de ser uma função de a,b,c e passa a ser uma 
função apenas de b,c. logo o "retorno" de (f a)b)c) é f b c
porém com o valor de a fixado.

lista
-a
-a,b
-soma3 a , b ,c

(soma3 a)->(b->(c->r))


(++) [a] -> [a]->[a]
[a] ++ ([a]->[a])


-}
listXList :: (Int->Int->Int)->[Int]->[Int]->[Int]
listXList _ [] [] = []
listXList f [] (h:t) = [f h 1] ++ (listXList f [] t)
listXList f (h:t) [] = [f 1 h] ++ (listXList f t [])
listXList f (x:xs) (h:t) = [f x h] ++ (listXList f xs t)



























