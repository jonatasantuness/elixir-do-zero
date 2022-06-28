# Substituindo os elementos da Lista

No mesmo `map()` onde percorremos a lista para números inteiros, podemos aproveitar para já realizar a lógica de substituição de números pelo _FizzBuzz_.

Ao invés de usar vários if/else (que inclusive não é recomendado nessa linguagem) podemos utilizar outras formas de controlar o fluxo da aplicação.

A função `convert_and_evaluate_numbers()` será responsável por obter cada elemento da lista de números, dentro dela criaremos outra função `evaluate_numbers()` que será responsável por obter o número e fazer a validação para checar as regras do FizzBuzz.

Para não utilizar vários código com `case`, neste caso, podemos utilizar os `Guards`, eles são formas de empoderar o Pattern Matching. Através da keyword `when` podemos utilizar métodos que nos auxiliam a validar valores recebidos como parâmetros das funções.

Quando receber um número e o resto da divisão for determinado valor, ai a função retorna o que é necessário para esta ocasião, como o Pattern Matching já retorna o valor na primeira ocorrência que encontrar, então a ordem das funções importa:

```elixir
defmodule FizzBuzz do
  def build(file_name) do
    file_name
    |> File.read()
    |> handle_file_read()
  end

  def handle_file_read({:ok, result}) do
    result
    |> String.split(",")
    |> Enum.map(&convert_and_evaluate_numbers/1)
  end

  def handle_file_read({:error, reason}), do: "Erro ao ler o arquivo: #{reason}"

  def convert_and_evaluate_numbers(elem) do
    number = String.to_integer(elem)
    evaluate_numbers(number)
  end

  def evaluate_numbers(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizzbuzz
  def evaluate_numbers(number) when rem(number, 3) == 0, do: :fizz
  def evaluate_numbers(number) when rem(number, 5) == 0, do: :buzz
  def evaluate_numbers(number), do: number
end
```

## Refatorando

Agora que o código já funciona, podemos melhorar a função `convert_and_evaluate_numbers()` utilizando o pipe operator:

```elixir
def convert_and_evaluate_numbers(elem) do
  elem
  |> String.to_integer()
  |> evaluate_numbers()
end
```

A única função que precisa ser pública neste módulo é a função `build()`, o resto pode ser privado, e para tornar a função privada é muito simples, basta renomear `def` para `defp`:

```elixir
defmodule FizzBuzz do
  def build(file_name) do
    file_name
    |> File.read()
    |> handle_file_read()
  end

  defp handle_file_read({:ok, result}) do
    result
    |> String.split(",")
    |> Enum.map(&convert_and_evaluate_numbers/1)
  end

  defp handle_file_read({:error, reason}), do: "Erro ao ler o arquivo: #{reason}"

  defp convert_and_evaluate_numbers(elem) do
    elem
    |> String.to_integer()
    |> evaluate_numbers()
  end

  defp evaluate_numbers(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizzbuzz
  defp evaluate_numbers(number) when rem(number, 3) == 0, do: :fizz
  defp evaluate_numbers(number) when rem(number, 5) == 0, do: :buzz
  defp evaluate_numbers(number), do: number
end
```

Como já vimos, é uma boa prática colocar tuplas como retorno das funções, então para o caso de erro, vamos retornar um Atom com status `error` e a mensagem de erro:

```elixir
defp handle_file_read({:error, reason}), do: {:error, "Erro ao ler o arquivo: #{reason}"}
```

E no caso de sucesso, colocamos o resultado da pipeline numa variável e retornamos uma tupla de sucesso:

```elixir
defp handle_file_read({:ok, result}) do
  result = result
    |> String.split(",")
    |> Enum.map(&convert_and_evaluate_numbers/1)

  {:ok, result}
end
```

## Referências

- [Guards](https://hexdocs.pm/elixir/guards.html)
