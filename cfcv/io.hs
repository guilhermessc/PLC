import Data.Char

putNtimes :: Int -> String -> IO () 
putNtimes n str | (n <= 1) = do putStrLn str
                | otherwise = do putStrLn str 
                                 putNtimes (n-1) str

len :: [Char] -> Int
len [] = 0
len (x:xs) = 1 + len xs  

converte :: [Char] -> Int -> Int
converte [] _ = 0
converte _ 0 = 0
converte (x:xs) n = ((digitToInt x)*10*(n-1)) + converte xs (n-1)   

main = do
      putStrLn "Digite seu nome"
      name <- getLine
      putStrLn "Digite o numero de vezes"
      qtd <- getLine
      putNtimes (converte qtd (len qtd)) name
