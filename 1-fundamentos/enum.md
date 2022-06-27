# Enum

No Elixir não é comum utilizar laços de repetição como While, for, etc, ao invés disso é utilizado a recursão.

A recursão é muito importante em diversos métodos embutidos do Elixir que iteram sobre coleções de dados, seja Map, List ou outros.

O módulo `Enum` possui várias funções para trabalhar com coleções de dados, como `each()`, `reduce()`, `sort()`, entre outros, veja alguns exemplos:

## Enum.sort()

Ordena uma lista na ordem crescente, possui uma variação com aridade 2, onde o segundo argumento é uma opção para ordenar de maneira decrescente:

```elixir
Enum.sort([5, 23, 77, 32, 13])
# [5, 13, 23, 32, 77]

Enum.sort([5, 23, 77, 32, 13], :desc)
[77, 32, 23, 13, 5]
```

## Enum.map()

Na maioria dos casos, os métodos de Enum, recebem 2 argumentos, sendo o primeiro a coleção que vamos trabalahar e o segundo uma função anônima.

no método `Enum.map()` por exemplo, podemos rodar uma função de callback para cada elemento da coleção:

```elixir
Enum.map([5, 23, 77, 32, 13], fn elem -> elem * 2 end)
# [10, 46, 154, 64, 26]
```

## Referências

- [Enum](https://hexdocs.pm/elixir/1.13.3/Enum.html)
- [Enum - Elixir School](https://elixirschool.com/pt/lessons/basics/enum)
