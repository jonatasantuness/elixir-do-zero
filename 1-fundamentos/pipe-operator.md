# Operador Pipe (|)

Para entender o operador pipe, imagina a seguinte situação, temos uma variável `nome` com valor inicial `" JoNaTaS "`, e queremos formatar este valor nessa ordem:

1. Remover os espaços da String.
2. Colocar tudo em caixa Baixa.

Uma das maneiras de se fazer isso seria ir colocando as funções uma dentro da outra na ordem:

```elixir
nome = "  JoNaTaS  "

String.trim(String.downcase(nome))
# "jonatas"
```

Porém dependendo da quantidade de funções e do tamanho disso, o código pode ficar bem ilegível.

Pensando nisso o operador pipe é muito útil para criar composições de funções, no Linux por exemplo, quando queremos listar todos os processos que estão rodando, utilizamos o comando `ps aux`, porém se quisermos filtrar somente pelo navegador Chrome por exemplo, podemos adicionar o pipe (`|`) e em seguida uma função de filtragem que irá compor a primeira função `ps aux | grep chrome`.

No Elixir a sintaxe para utilizar o operador pipe é `|>`, ele sempre vai passar o resultado da expressão anterior como argumento para a proxima função, então basta colocarmos as funções na ordem:

```elixir
nome |> String.trim() |> String.downcase()
# "jonatas"
```

> Neste caso nem precisamos adicionar o argumento para as funções de composição, porque o **PRIMEIRO** argumento delas já fica implícito que é o retorno da última expressão, porém se a função precisar de mais argumentos ai precisaria passá-los.

## Referências

- [Pipe operator - Elixir School](https://elixirschool.com/pt/lessons/basics/pipe_operator)
