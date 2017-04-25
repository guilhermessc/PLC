data Bt = SubT Int Bt Bt | Null
     deriving Show

instance Num Bt where
    fromInteger a = SubT (fromInteger a) (Null) (Null) 

exemplo :: Bt
exemplo = SubT 1 Null (SubT 5 Null (SubT 8 (SubT 6 Null Null) Null))


mostra :: Bt -> String
mostra (SubT a n m) = (mostra n) ++ (show a) ++ (show ' ') ++ (mostra m)
mostra Null = (show '.')

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
listArv (a:as) = insert (SubT a Null Null) (listArv as)
