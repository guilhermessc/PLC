data Bt = SubT Int Bt Bt | Null
     deriving Show

insert :: Bt -> Bt -> Bt
insert a (Null) = a
insert (Null) a = a
insert (SubT a mint maxt) (SubT n b c) | n == a = (SubT a mint maxt) -- sem repetições
                                       | n > a = SubT a  mint (insert maxt (SubT n b c))
                                       | otherwise = SubT a (insert mint (SubT n b c)) maxt

avrLista :: Bt -> [Int]
avrLista (Null) = []
avrLista (SubT a min max) = (avrLista min) ++ [a] ++ (avrLista max) 

somaArv :: Bt -> Int
somaArv a = foldr (+) 0 (avrLista a)

listArv :: [Int] -> Bt
listArv [] = (Null)
listArv (a:as) = insert (listArv as) (SubT a Null Null)

maiorAvr :: Bt -> Int
maiorAvr (Null) = 0
maiorAvr (SubT _ x y) = 1 + (max (maiorAvr x) (maiorAvr y))
