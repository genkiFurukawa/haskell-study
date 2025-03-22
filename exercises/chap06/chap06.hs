import Data.Char
import Data.List (find)

-- 文字の数値をとってoffsetを足したものを文字に変換
encode :: Int -> String -> String
encode offset msg = map (\c -> chr $ ord c + offset) msg

decode :: Int -> String -> String
decode shift msg = encode (negate shift) msg

-- 数値の格桁の値の合計を返す関数
digitSum :: Int -> Int
digitSum = sum . map digitToInt . show

firstTo :: Int -> Maybe Int
firstTo n = find (\x -> digitSum x == n) [1 ..]
