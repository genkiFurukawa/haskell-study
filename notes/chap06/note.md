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
