# Pattern Matching

No Elixir o operador `=` não é um operador de atribuição, é um operador de Matching, assim como na matemática, considerando a expressão `x + 2 = 0`, para que essa expressão seja verdadeira o valor de `x` precisa ser `-2` certo? no Elixir é a mesma coisa.

Se criarmos uma variável `x` e atribuir `1`, isso será verdadeiro mesmo se você inverter isso:

```elixir
x = 1
# 1

1 = x
# 1
```

Porém como esperado só podemos utilizar o Pattern Matching para atribuição de valor, quando a variável está do lado esquerdo da expressão e o padrão a ser testado está do lado direito.

## Desestruturação com Listas

Através do Pattern Matching podemos realizar desestruturações, no exemplo abaixo temos uma lista com 3 valores, sendo um deles `x` sendo comparado com outra lista com 3 valores numéricos.

```elixir
[1, x, 3] = [1, 2, 3]
# [1, 2, 3]
```

Nesse caso o Pattern Matching entrou em ação e percebeu que para essa expressão ser verdadeira. o `x` precisava ser igual à `2`, então ele desestrutura a segunda lista para a primeira receber esse valor.

Outro exemplo legal disso, é o uso do Pattern Matching para desestrutura uma lista em conjunto com o operador pipe (`|`) e assim criar uma variável para head e outra para tail da lista respectivamente:

```elixir
[myHead | myTail] = [1, 2, 3]

myHead
# 1

myTail
# [2, 3]
```

## Desestruturação com Maps

Com Maps também podemos utilizar o Pattern Matching para fazer desestruturações, e como no Map as chaves não possuem uma ordem, então não é necessário repetir todos os elementos, neste caso vamos apenas obter o valor da chave `name` e atribuir numa variável com o mesmo nome:

```elixir
%{name: name} = %{name: "Iphone X", categoria: "smartphones", preco: 3000}

name
# "Iphone X"
```

## Desestruturação com Tuplas

E com Tuplas isso também é possível, neste caso temos que manter a ordem da estrutura:

```elixir
{:ok, resultado} = {:ok, "operação concluida!"}
# "operação concluida!"
```

## Referências

- [Pattern Matching](https://elixirschool.com/pt/lessons/basics/pattern_matching)
