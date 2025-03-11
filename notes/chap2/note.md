- 型クラス は「何らかの振る舞いを定義するインターフェース」
  - 型クラスというのは関数の集まりを定める。ある型クラスに属する関数のことを、その型クラスのメソッドと呼ぶこともある。
- 等価演算子(==)は実際は関数

```haskell
-- 「=>」は 型クラス制約 を表す
-- 「等値性関数は、同じ型の任意の引数の2つの引数を取り、Boolを返す。引数の2つの型はEqクラスのインスタンスでなければならない」の意味
-- Eqのインスタンスは==と/=が実装されていなければならない
ghci> :t (==)
(==) :: Eq a => a -> a -> Bool

-- Integer は
ghci> :info Integer
type Integer :: *
data Integer
  = GHC.Num.Integer.IS GHC.Prim.Int#
  | GHC.Num.Integer.IP GHC.Prim.ByteArray#
  | GHC.Num.Integer.IN GHC.Prim.ByteArray#
        -- Defined in ‘GHC.Num.Integer’
instance Integral Integer -- Defined in ‘GHC.Real’
instance Num Integer -- Defined in ‘GHC.Num’
instance Real Integer -- Defined in ‘GHC.Real’
instance Enum Integer -- Defined in ‘GHC.Enum’
instance Eq Integer -- Defined in ‘GHC.Num.Integer’
instance Ord Integer -- Defined in ‘GHC.Num.Integer’
instance Read Integer -- Defined in ‘GHC.Read’
instance Show Integer -- Defined in ‘GHC.Show’

ghci> :t (+)
(+) :: Num a => a -> a -> a
-- + はNum型の引数を2つ受け取ってNum型の値を返す
ghci> (+) 3 4
7
ghci> 3 + 4
7
```
