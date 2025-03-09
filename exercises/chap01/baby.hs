doubleMe x = x + x

-- :l ./exercises/chap01/baby.hs
-- ghci> doubleMe 9
-- 18

doubleUs x y = x * 2 + y * 2

-- ghci> doubleUs 1 2
-- 6

doubleSmallNumber x =
  if x > 100
    then x
    else x * 2

-- ghci> doubleSmallNumber 100
-- 200
-- ghci> doubleSmallNumber 101
-- 101
-- ghci> doubleSmallNumber 99
-- 198

-- アポストロフィはHaskellでは特別な意味を持たない関数名の一部として有効な文字
doubleSmallNumber' x = (if x > 100 then x else x * 2) + 1

-- ghci> doubleSmallNumber' 100
-- 201
-- ghci> doubleSmallNumber' 101
-- 102
-- ghci> doubleSmallNumber' 99
-- 199