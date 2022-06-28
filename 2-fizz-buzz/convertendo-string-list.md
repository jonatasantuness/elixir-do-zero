# Convertendo String em Lista

Neste passo vamos converter a lista de números que vem do arquivo `numbers.txt` em formato de String para uma lista de números de fato.

Como a String vem no formato `1,2,3...`, vamos utilizar o método `String.split()` para separar os valores com base na virgula. Isso irá nos retornar uma lista com números porém em formato de String ainda, para converter cada item para número podemos percorrer a lista com `Enum.map()` e converter cada item com `String.to_integer()`:

```elixir
def handle_file_read({:ok, result}) do
  list = String.split(result, ",")

  Enum.map(list, fn number -> String.to_integer(number) end)
end
```

Quando precisamos dessa função anônima que chama outra função de callback que já existe, nós podemos deixar o código ainda mais curto utilizando a sintaxe com `&` e chamar direto o callback, neste caso será necessário deixar explícito através da keyword `/` que a aridade dessa função é `1`, ou seja, espera apenas 1 argumento, logo não precisamos especificá-lo:

```elixir
def handle_file_read({:ok, result}) do
  list = String.split(result, ",")

  Enum.map(list, &String.to_integer/1)
end
```

E ainda dá para melhorar mais, porque estamos utilizando uma linha só para guardar a variável `list`, porém este código pode ser feito de maneira encadeada utilizando o pipe operator, ocultando sempre os valores dos primeiros argumentos das funções encadeadas:

```elixir
def handle_file_read({:ok, result}) do
  result
  |> String.split(",")
  |> Enum.map(&String.to_integer/1)
end
```

Aproveitando podemos deixar a mensagem de erro mais amigável através da interpolação de String:

```elixir
def handle_file_read({:error, reason}), do: "Erro ao ler o arquivo: #{reason}"
```

O código final ficou assim:

```elixir
defmodule FizzBuzz do
  def build(file_name) do
    file_name
    |> File.read()
    |> handle_file_read()
  end

  defp handle_file_read({:ok, result}) do
    result = result
      |> String.split(",")
      |> Enum.map(&convert_and_evaluate_numbers/1)

    {:ok, result}
  end

  defp handle_file_read({:error, reason}), do: {:error, "Erro ao ler o arquivo: #{reason}"}

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
