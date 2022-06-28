defmodule FizzBuzzTest do
  use ExUnit.Case

  describe "build/1" do
    test "Quando um arquivo válido é fornecido, retorna uma lista FizzBuzz" do
      expected_response = {:ok, [1, 2, :fizz, 4, :buzz, :buzz, :fizzbuzz, :buzz]}
      assert FizzBuzz.build("numbers.txt") == expected_response
    end

    test "Quando um arquivo inválido é fornecido, retorna mensagem de erro" do
      expected_response = {:error, "Erro ao ler o arquivo: enoent"}
      assert FizzBuzz.build("invalid.txt") == expected_response
    end
  end
end
