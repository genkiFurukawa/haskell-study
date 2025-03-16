import Main (reverse')

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

-- コラッツ列
chain :: Int -> [Int]
chain 1 = [1]
chain n
  | even n = n : chain (div n 2)
  | odd n = n : chain (n * 3 + 1)

-- 1から100までの数のうち、長さ15以上のコラッツ列の開始数になるものはいくつか？
numLongChains :: Int
numLongChains = length (filter (>= 15) (map length (map chain [1 .. 100])))

-- 本の書き方
numLongChains' :: Int
numLongChains' = length (filter isLong (map chain [1 .. 100]))
  where
    isLong xs = length xs >= 15

-- ラムダ式を使ったパターン
numLongChains'' :: Int
numLongChains'' = length (filter (\xs -> length xs >= 15) (map chain [1 .. 100]))

-- アキュムレータを使った実装れい
product' :: (Num a) => [a] -> a
product' = foldl (*) 1
