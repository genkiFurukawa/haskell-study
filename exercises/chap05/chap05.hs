applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

-- 型aと型bを引数、型cを返す関数を第一引数、型aのリストと型bのリストを引数にして、型cのリストを返す関数
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x : xs) (y : ys) = f x y : zipWith' f xs ys

flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f = g
  where
    g x y = f y x

-- 10万以下の数のうち、3829で割り切れるものの最大値
largestDivisible :: Integer
largestDivisible = head (filter p [100000, 99999 ..])
  where
    p x = (==) (mod x 3829) 0
