# listas

As listas são coleções de valores que diversos tipos.

```elixir
[1, "two", 3, :four]
# [1, "two", 3, :four]
```

No Elixir o tipo `List` é implementando de forma encadeada ou lista ligada, ou seja, os elementos da lista estão contidos na memória um após o outro, de forma que qualquer operações sobre uma lista, tem execução linear, isso quer dizer, quanto maior a lista maior o tempo para percorrê-la.

Diferente de um array/vetor em JavaScript por exemplo, onde posso acessar um elemento da seguinte forma `produtos[2]`, em Elixir normalmente a gente percorre a lista para fazer as operações.

Como temos elementos linkados na memória, adicionar um elemento no início da lista é barato, podemos fazer isso assim:

```elixir
users = ["Carlos", "Maria", "Anderson"]

["Jonatas" | users]

# ["Jonatas", "Carlos", "Maria", "Anderson"]
```

Porém apenas fazendo isso o valor da variável não é modificado então teria que reatribuir o valor:

```elixir
users
# ["Carlos", "Maria", "Anderson"]

users = ["Jonatas" | users]
# ["Jonatas", "Carlos", "Maria", "Anderson"]
```

Colocar um item na última lista é mais custoso, porque teriamos que percorrer a lista inteira até chegar no último elemento, que não aponta para ninguém, e adicionar o elemento no final.

Temos os operadores `hd` (head) e `tl` (tail), que retornam respectivamente o primeiro elemento e a cauda da lista (cauda não é o último elemento, e sim o restante da lista):

```elixir
hd users
# "Jonatas"

tl users
# ["Carlos", "Maria", "Anderson"]
```

Com o operador `++` podemos concatenar listas:

```elixir
users ++ ["Rafael"]
# ["Jonatas", "Carlos", "Maria", "Anderson", "Rafael"]
```

Mesmo se o valor já existir ele será adicionado ao final:

```elixir
users ++ ["Carlos"]
# ["Jonatas", "Carlos", "Maria", "Anderson", "Carlos"]
```

E utilizando o operador `--`, se o valor já existir ele será removido:

```elixir
users -- ["Carlos"]
# ["Jonatas", "Maria", "Anderson"]
```

O tipo List possui métodos que podem ser utilizado para obter valores, o `List.first()` por exemplo, retorna o primeiro elemento:

```elixir
List.first(users)
# "Jonatas"
```

O `List.last()` retorna o último elemento:

```elixir
List.last(users)
# "Anderson"
```

## Referências

- [List](https://hexdocs.pm/elixir/1.13.3/List.html)
- [Collections](https://elixirschool.com/pt/lessons/basics/collections/)
