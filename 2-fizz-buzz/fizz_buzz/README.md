# FizzBuzz

Neste projeto utilizaremos como base o jogo _FizzBuzz_. O jogo consiste na entrada de números vindos do usário ou de algum arquivo, e alguns desses números podem ser modificados pelas seguintes regras:

- Múltiplos de 3 são substituídos pela palavra Fizz
- Múltiplos de 5 são substituídos pela palavra Buzz
- Múltiplos de 3 e 5 são substituídos pela palavra FizzBuzz

## Rodando o projeto

Para rodar o projeto é necessáro possuir o Elixir instalado, entre no diretório `2-fizz-buzz/fizz_buzz` e execute o comando:

```sh
iex -S mix
```

Ao rodar o comando, o IEX irá solicitar o nome do projeto seguido da função que queremos executar então digite:

```sh
FizzBuzz.build("numbers.txt")
```
