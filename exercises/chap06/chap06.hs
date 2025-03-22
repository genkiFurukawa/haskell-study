import Data.Char

-- 文字の数値をとってoffsetを足したものを文字に変換
encode :: Int -> String -> String
encode offset msg = map (\c -> chr $ ord c + offset) msg

decode :: Int -> String -> String
decode shift msg = encode (negate shift) msg
