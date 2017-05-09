-- Função que eleva ao quadrado cada elemento da lista usando MAP
sqt_list :: [Int] -> [Int]
sqt_list l = map square l
    where square x = x*x

-- Função que eleva e soma os elementos da lista usando foldl
sqsum :: [Int] -> Int
sqsum [] = 0
sqsum l = foldl1 somaq l 
   where somaq x y = x + (y*y)
  
-- Mesma Função acima porém com função lambda 
sqsum_lamb :: [Int] -> Int
sqsum_lamb [] = 0
sqsum_lamb l = foldr1 (\x -> \y -> (x*x)+y) l 

-- Função que retira da lista todos os elementos menores que zero usando a função filter
gtzero :: [Int] -> [Int]
gtzero l = filter verify l
     where verify x = (x>0)

