1) 

a) ( . ) thrice map

(.) :: (b -> c) -> (a -> b) -> a -> c
map :: (x -> y) -> [x] -> [y]
thrice :: (t->t)->t->t


(b->c) = (t->t)->t->t
b = (t->t)
c = t->t

(a->b) = (x->y)->[x]->[y]
a = (x->y)
b = [x]->[y]

[x]->[y] = t->t

t = [x]
t = [y]
[x] = [y];x = y; c = [x]->[y]

a->c = (x->y)->[x]->[y]

b) swap map thrice

swap :: a -> (a -> b) -> b
map :: (x -> y) -> [x] -> [y]
thrice :: (k -> k) -> k -> k

a = (x->y)->[x]->[y]

(a->b) = (k -> k) -> k -> k
a = k->k
b = k->k

k->k = (x->y)->[x]->[y]
k = x->y
k = [x]->[y]
como não se pode ser ao mesmo tempo alguma coisa e uma lista de alguma coisa, não possui tipo

2) 
a)
f :: ?
f = map ( + )

Sabemos que o tipo de retorno de f será o tipo de retorno de map
map :: (x -> y) -> [x] -> [y]
(+) :: Int -> Int -> Int

(x->y) = Int->Int->Int
x = Int
y = Int->Int

[Int]->[Int->Int]


b)
f = (.) map map

(.) :: (b -> c) -> (a -> b) -> (a -> c)
map :: (x -> y) -> [x] -> [y]


(b->c) = (x->y)->[x]->[y]
b = (x->y)
c = [x]->[y]

(a->b) = (k->l)->[k]->[l]
a = (k->l)
b = [k]->[l]

[k]->[l] = (x->y)
x = [k]
y = [l]

f :: (k->l) -> [[k]]->[[l]],nice









Prova 

( . ) : : ( b−> c ) −> ( a −> b ) −> a −> c
( . ) : : ( x −> y ) −> ( x −> k ) −> x −> y
map : : (l->m)−>[l]−>[m]

(b->c) = (l->m)−>[l]−>[m]
b = l->m
c = [l]->[m]


(a->b) = ( x −> y ) −> ( x −> k ) −> x −> y
a = (x->y)
b =  ( x −> k ) −> x −> y


l->m = ( x −> k ) −> x −> y
l = (x->k)
m = x->y

o retorno dessa função sera a->c,logo
x->y->[x->y]->[x->k]





(.) map (.) 

















