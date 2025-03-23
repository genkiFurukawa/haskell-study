- 型シノニム
  - 同意語、類義語、別名、異名などの意味
  - `type`を使って宣言する
- ただの文字列ではなくて、実際に表しているものの情報を伝えるためにシノニムがある

```haskell
type String = [char]
--
type PhoneNumber = String
type Name = String
type PhoneBook = [(Name, PhoneNumber)]
```
