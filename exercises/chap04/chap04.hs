-- 再起的にmaximumを定義
-- maximum' [1, 3, 2]
-- max 1 maximum' [3, 2] => max 1 (max 3 maximum' [2]) => max 1 (max 3 2) => max 1 3 => 3
maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximum of empty list"
maximum' [x] = x
maximum' (x : xs) = max x (maximum' xs)

replicate' :: Int -> a -> [a]
replicate' n x
  | n <= 0 = []
  | n > 0 = x : replicate' (n - 1) x

take' :: Int -> [a] -> [a]
take' n _
  | n <= 0 = []
take' _ [] = []
take' n (x : xs) = x : take' (n - 1) xs

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x : xs) = reverse' xs ++ [x] -- ++ はリストの連結

-- 無限リストを作る
repeat' :: a -> [a]
repeat' x = x : repeat' x

-- ghci> take' 5 (repeat' [1,2])
-- [[1,2],[1,2],[1,2],[1,2],[1,2]]
-- ghci> take' 5 (repeat' 3)
-- [3,3,3,3,3]

zip' :: [a] -> [b] -> [(a, b)]
zip' _ [] = []
zip' [] _ = []
zip' (x : xs) (y : ys) = (x, y) : zip' xs ys

elem' :: (Eq a) => a -> [a] -> Bool
elem' _ [] = False
elem' a (x : xs)
  | a == x = True
  | otherwise = elem' a xs

-- クイックソート
-- ピボットを決めて、それより小さいリストと大きいリストを作る
-- 自分で書いたもの（リスト内表記がわからなかったのでfileterで代用）
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x : xs) =
  let leftList = filter (<= x) xs
      rightList = filter (> x) xs
   in quicksort leftList ++ [x] ++ quicksort rightList

-- 本の内容
-- リスト内表記を使う + 変数名がわかりやすい
quicksort' :: (Ord a) => [a] -> [a]
quicksort' [] = []
quicksort' (x : xs) =
  let smallerOrEqual = [a | a <- xs, a <= x]
      larger = [a | a <- xs, a > x]
   in quicksort smallerOrEqual ++ [x] ++ quicksort larger
