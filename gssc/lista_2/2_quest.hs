-- 2

-- (.) :: (b -> c) -> (a -> b) -> a -> c
-- map :: (a -> b) -> [a] -> [b]

twice :: (a -> a) -> a -> a
twice f x = f (f x)

thrice :: (a -> a) -> a -> a
thrice f x = f (f (f x))

swap :: a -> (a -> b) -> b
swap f g = g f

-- a) (.) thrice map => thrice(map(f()), [a])
fa :: (a -> a) -> [a] -> [a]
fa = (.) thrice map
-- exemplo: fa id [1..5]
-- 			fa (*2) [1..5]
-- 
-- funciona, portanto, tem tipo. 


-- b)
-- swap 	:: a -> (a -> b) -> b
-- map 		:: (y -> z) -> [y] -> [z]
-- thrice 	:: (x -> x) -> x -> x
-- 
-- swap map thrice =>
-- 		i.		a = (y -> z) -> [y] -> [z] 
-- 		
-- 		ii.		(a -> b) = (x -> x) -> x -> x =>
-- 				=> a = (x -> x) => b = x -> x
-- 				
-- 		iii.	(i) && (ii) => a = (y->z)->[y]->[z] 
-- 							   && a = (x -> x) =>
-- 				=> (y->z)->[y]->[z] = (x -> x) =>
-- 				=> (x -> x) = (y->z)->[y]->[z] =>
-- 				=> 	
-- 					I.	x = (y->z)
--  				II.	x = [y]->[z]
--  			=> Absurdo
-- 
-- 	=> Absurdo.
-- Logo, essa função não tem tipo.

