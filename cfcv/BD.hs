-- Banco de Dados
type Pessoa = String
type Livro = String
type Banco = [(Pessoa, Livro)]

-- banco de dados em si
exemplo :: Banco
exemplo = [("carlos", "circuitos"), (carlos", "shell script"), ("guilherme", "A arte de ser homossexual"),("brayner", "como invadir um pc")]

-- Consulta os livros de cada pessoa no banco de dados
livros :: Banco -> Pessoa -> [Livro]
livros [] _ = []
livros ((p,l):xs) people | (p == people) = [l]++livros xs people
                         | otherwise = livros xs people  