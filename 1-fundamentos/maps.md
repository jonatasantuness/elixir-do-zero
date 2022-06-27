# Maps

O tipo `Map` é a coleção de chave-valor do Elixir, diferente de [List](listas.md) e [Keyword](keyword.md), o Map permite chaves de qualquer tipo e não seguem uma ordem, podemos definir um map com a sintaxe `%{}`:

```elixir
filtros = %{order: "Ordenação", label: "Selo"}
# %{label: "Selo", order: "Ordenação"}
```

Para acessar algum valor, utilize (`:`) seguido do nome da chave, como um Atom:

```elixir
filtros[:order]
# "Ordenação"
```

E a notação de ponto (`.`) também funciona:

```elixir
filtros.order
# "Ordenação"
```

Existe uma outra forma de criar Maps, com chaves em forma de Strings e a keyword `=>` para atribuir o valor:

```elixir
departamentos = %{"jur" => "Juridico", "mkt" => "Marketing"}
# %{"jur" => "Juridico", "mkt" => "Marketing"}
```

Nesta sintaxe o valor pode ser obtido informando a chave como uma String:

```elixir
departamentos["mkt"]
# "Marketing"
```

Apesar da sintaxe de Atoms possuir mais modos de se obter o valor, muitos frameworks como o _Phoenix_ preferem utilizar a sintaxe de String, isso porque existe uma limitação de quantos Atoms a aplicação pode ter (são muitos, mas existe uma limitação), então por segurança, receber dados de API utilizando a notação de String é melhor.

Se um elemento cujo a chave já exista for adicionado no Map, então o valor será sobreescrito:

```elixir
jogadores = %{"goleiro" => "Dida", "centroavante" => "Ronaldo", "goleiro" => "Cássio"}
# %{"centroavante" => "Ronaldo", "goleiro" => "Cássio"}
```

Para atualizar o valor de um determinado elemento no Map, podemos utilizar a keyword `|`:

```elixir
premios = %{ouro: "Iphone", prata: "Kindle", bronze: "caneta"}

 %{premios | bronze: "Camiseta"}

# %{bronze: "Camiseta", ouro: "Iphone", prata: "Kindle"}
```

Lembrando que isso não altera o Map original, se quiser de fato modificá-lo terá que reatribuir.

O tipo Map possi diversos métodos para interagir, entre eles o `Map.put()` que insere um novo elemento chave-valor:

```elixir
Map.put(premios, :ferro, "caneca")
# %{bronze: "caneta", ferro: "caneca", ouro: "Iphone", prata: "Kindle"}
```

## Referências

- [Maps](https://hexdocs.pm/elixir/1.13.3/Map.html)
- [Collections](https://elixirschool.com/pt/lessons/basics/collections/)
