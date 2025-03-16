- 畳み込みについて

  - 畳み込み関数: 2 引数関数 + アキュムレータの初期値 + 畳み込むリスト

- `$`は関数適用演算子

  ```haskell
  ghci> :t ($)
  ($) :: (a -> b) -> a -> b
  ghci> sqrt $ 3 + 4 + 5
  3.4641016151377544
  ghci> sqrt $ 3 + 7 + 6
  4.0
  ghci> sqrt 3 + 7 + 6
  14.732050807568877
  ```

  - 関数適用演算子（`$`）を使うことで、カッコの数を減らせる

    - `f a b c ` は `((f a) b) c`を意味する（左結合）
    - `f $ a b c ` は `f ((a b) c)`を意味する（右結合）

    ```haskell
    ghci> filter (> 10) (map (*2) [2..10])
    [12,14,16,18,20]
    ghci> sum (filter (> 10) (map (*2) [2..10]))
    80
    ghci> sum (filter (> 10) $ map (*2) [2..10])
    80
    ghci> sum $ filter (> 10) $ map (*2) [2..10]
    80
    ```

- a

  ```haskell
  ghci> sum (replicate 5 (max 6.7 8.9))
  44.5
  ghci> sum (replicate 5 $ max 6.7 8.9)
  44.5
  ghci> sum . replicate 5 $ max 6.7 8.9
  44.5
  ```
