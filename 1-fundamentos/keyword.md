# Keyword

O tipo `Keyword` é uma lista feita exclusivamente por tuplas de 2 elementos de chave e valor.

As chaves devem ser Atoms únicos e ordenados, justamente por causa disso são normalmente utilizadas para estruturar argumentos para funções, assim ao utilizar a função, os argumentos devem ser passados na ordem correta.

```elixir
[{:exit_on_close, true}, {:active, :once}, {:packet_size, 1024}]
# [exit_on_close: true, active: :once, packet_size: 1024]
```

## Referências

- [Keyword](https://hexdocs.pm/elixir/1.13.3/Keyword.html)
- [Collections](https://elixirschool.com/pt/lessons/basics/collections/)
