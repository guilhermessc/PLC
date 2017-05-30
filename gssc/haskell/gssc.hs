-- This function mirrors a generic list of elements
mirror :: [t] -> [t]
mirror [] = []
mirror (a:as) = [a] ++ mirror as ++ [a]

-- This function creates a list of n elements
lonel :: Int -> t -> [t]
lonel 0 e = []
lonel n e | n < 0 = error "Invalid argument"
          | otherwise = [e] ++ (lonel (n-1) e)
            
-- This function repeats each element of list n times
rep :: Int -> [t] -> [t]
rep n [] = []
rep n (a:as) = (lonel n a) ++ (rep n as)

-- type declarations ------------------
type Pessoa = String
type Livro = String
type Banco_de_dados = [(Pessoa, Livro)]
type Bd = Banco_de_dados
---------------------------------------

-- This function checks is an element is present in a list
membro :: [Int] -> Int -> Bool
membro xs y = [x | x <- xs, x == y] /= [] -- this line gives a list of elements x from xs that are equal to y

livros :: Bd -> Pessoa -> [Livro]
livros bd p = [book | (person, book) <- bd, person == p]


-- Variables --------------------------
livros_in :: Bd
livros_in = [("Carlos", "fifty shades of gray"), ("Lucas", "Java Java Javaa"), ("Guilherme", "The BRO code"), ("Brayner", "HW"), ("Guilherme", "Neural Networks")]

gssc :: Pessoa
gssc = "Guilherme"