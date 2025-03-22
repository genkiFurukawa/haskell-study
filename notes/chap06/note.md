```haskell
ghci> import Data.List
ghci> -- boomが後からも出てくる
ghci> group ["boom", "bip", "bip", "boom", "boom"]
[["boom"],["bip","bip"],["boom","boom"]]
ghci> group $ sort ["boom", "bip", "bip", "boom", "boom"]
[["bip","bip"],["boom","boom","boom"]]
ghci> (group . sort) ["boom", "bip", "bip", "boom", "boom"]
[["bip","bip"],["boom","boom","boom"]]
```

- find は(a -> Bool)と t a 型を受け取っって、Maybe a 型を返す関数.t は Foldable を満たす（リストなど）。

```
ghci> :t find
find :: Foldable t => (a -> Bool) -> t a -> Maybe a
ghci> :info Maybe
type Maybe :: * -> *
data Maybe a = Nothing | Just a
ghci> find (> 4) [3,4,56]
```
