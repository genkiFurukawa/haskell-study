## 質問

```
ghci> length (1:2:[])
2
ghci> length 1:2:[]

<interactive>:32:8: error:
    • No instance for (Num [a0]) arising from the literal ‘1’
    • In the first argument of ‘length’, namely ‘1’
      In the first argument of ‘(:)’, namely ‘length 1’
      In the expression: length 1 : 2 : []

どうして2つ目はエラーになるのですか？
```

## 回答

Haskell の型推論の仕組みが関係しています。それぞれの式の型を見ていきましょう。

---

### ✅ **最初の式（動作する方）**

```haskell
ghci> length (1:2:[])
2
```

`1:2:[]` はリスト `[1,2]` を作る記法であり、型は以下のようになります。

```haskell
1  :: Num a => a
2  :: Num a => a
[] :: [a]

1:2:[] :: [a]  -- 数値のリスト
```

そして、`length` はリストの長さを求める関数で、型は次の通りです。

```haskell
length :: [a] -> Int
```

したがって、`length (1:2:[])` は `[1,2]` を引数に `length` を適用して `2` を返します。

---

### ❌ **2 つ目の式（エラーになる方）**

```haskell
ghci> length 1:2:[]
```

この式は、以下のように解釈されます。

```haskell
(length 1) : (2 : [])
```

ここで問題になるのは `length 1` です。`length` は **リストに対してのみ適用できる関数** なので、`1` を引数にすると型エラーになります。

#### **エラーの詳細**

`length` の型は `[a] -> Int` なので、本来リストが必要です。しかし、`length 1` を評価しようとすると、`1` はリストではなく `Num a => a` なので、型エラーになります。

エラーメッセージを分解すると：

```
• No instance for (Num [a0]) arising from the literal ‘1’
```

これは `1` を **リスト型の数値** として解釈しようとして失敗していることを意味します。つまり、Haskell は `length` の引数がリストであるべきなのに、リストではない `1` を渡したため、型の不整合が発生しました。

---

### **結論**

- `(1:2:[])` はリスト `[1,2]` を生成し、`length` に渡すと `2` を返すので OK。
- `length 1:2:[]` は `length 1` の部分で型エラーになる。
- `length` はリストにしか適用できないので、`length 1` は無効。
