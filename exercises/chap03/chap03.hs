lucky :: Int -> String
lucky 7 = "LUCKY NUMBER SEVEN"
lucky x = "Sorry, you're out of luck, pal!"

factorial :: Int -> Int
factorial 0 = 1
factorial x = x * factorial (x - 1)

-- ghci> factorial 1
-- 1
-- ghci> factorial 2
-- 2
-- ghci> factorial 5
-- 120

-- ガードの使い方サンプル
bmiTell :: Double -> String
bmiTell bmi
  | bmi <= 18.5 = "aa"
  | bmi <= 25.0 = "bb"
  | otherwise = "cc"

-- where句
bmiTell' :: Double -> Double -> String
bmiTell' weight height
  | bmi <= 18.5 = "aa"
  | bmi <= 25.0 = "bb"
  | otherwise = "cc"
  where
    -- 値が一度しか計算されない + 修正も1か所で良い
    bmi = weight / height ^ 2
    -- 値に名前を付けられるので可読性も上がる
    skiny = 18.5
    normal = 25.0

-- ファーストネームとラストネームを受け取ってイニシャルを返す
initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
  where
    -- where句の中でもパターンマッチが使える
    -- 「_」は予約語
    (f : _) = firstname
    (l : _) = lastname

calcBmis :: [(Double, Double)] -> [Double]
calcBmis xs = [bmi w h | (w, h) <- xs]
  where
    -- where句の中で関数を宣言できる
    bmi weight height = weight / height ^ 2

-- letの使い方
cylinder :: Double -> Double -> Double
cylinder r h =
  let sideArea = 2 * pi * r * h
      topArea = pi * r ^ 2
   in sideArea + 2 * topArea
