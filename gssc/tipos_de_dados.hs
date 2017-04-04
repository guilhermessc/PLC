-- construtores de tipos

-- Tipos Enumerdaos --------------------------------------
data Estacao = Inverno | Verao | Primavera | Outono
data Temp = Frio | Quente
     deriving Show -- isso faz com que o resultado
                   -- possa ser impresso no terminal

clima :: Estacao -> Temp
clima Inverno = Frio
clima _ = Quente

-- Tipos Produto -----------------------------------------
type Nome = String
type Idade = Int

data Pessoas = Pessoa Nome Idade
-- Pessoas : Tipo de dado
-- Pessoa  : Construtor
-- data Pessoas = Pessoa String Int

maria = Pessoa "Maria" 23
jose = Pessoa "Jose" 82

showPerson :: Pessoas -> String
showPerson (Pessoa n a) = n ++ " -- " ++ show a

-- Alternativas ------------------------------------------

data Shape = Circle Float | Rectangle Float Float | Monster

isRound :: Shape -> Bool
isRound (Circle _) = True
isRound _ = False