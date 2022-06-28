# Lendo o arquivo

## Módulos

Esta é a estrutura básica de um módulo:

```elixir
defmodule FizzBuzz do
  # code
end
```

## Funções

Esta é a estrutura básica de uma função:

```elixir
def build(file_name) do
 # code
end
```

## Iniciando o Projeto

Para iniciar o projeto, vamos constuir o nosso primeiro módulo e a primeira função que se chamará `build`, esta função receberá um arquivo para leitura.

Para o controle do fluxo vamo utilizar o `case`, este método nos permite tomar diferentes ações para diferentes situações, então caso o arquivo retorne a tupla de sucesso, nos vamos utilizar o Patten Matching para desestruturar o resultado e exibir somente o texto dele, caso de erro, faremos a mesma coisa porém exibindoa mensagem de erro:

```elixir
defmodule FizzBuzz do
  def build(file_name) do
    case File.read(file_name) do
      {:ok, result} -> result
      {:error, reason} -> reason
    end
  end
end
```

## IEX em Projetos

Dentro de Projetos, podemos testar nossos arquivos no teminal utilizando o IEX, vamos compilar o código e executá-lo dentro do próprio IEX:

```sh
iex -S mix
```

Ao rodar o comando, o IEX irá solicitar o nome do projeto seguido da função que queremos executar então digite:

```sh
FizzBuzz.build("numbers.txt")
```

Você pode utilizar o comando `recompile` para rodar novamente quando houver alguma alteração.

## Pattern Matching em parâmetros

Uma outra maneira de escrever este mesmo código seria utilizando a estratégia do Pattern Matching no póprio parâmetro da função, desta forma, podemos criar uma função chamada `handle_file_read()` e configurar duas validações através do argumento para assim retornar suas respectivas mensagens:

```elixir
defmodule FizzBuzz do
  def build(file_name) do
    file = File.read(file_name)
    handle_file_read(file)
  end

  def handle_file_read({:ok, result}), do: result
  def handle_file_read({:error, reason}), do: reason
end
```

E podemos melhorar ainda mais o código, vamos utilizar do poder do operador pipe para criar, ler o arquivo e executar a função de validação, tudo de modo encadeado:

```elixir
defmodule FizzBuzz do
  def build(file_name) do
    file_name
    |> File.read()
    |> handle_file_read()
  end

  def handle_file_read({:ok, result}), do: result
  def handle_file_read({:error, reason}), do: reason
end
```
