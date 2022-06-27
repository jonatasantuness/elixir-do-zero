# Tipos básicos

O Elixir é uma linguagem de _Tipagem Dinâmica_, ou seja, não precisamos definir o tipo do dado ao criar alguma variável, basta atribuir o valor.

## Atom

Atom's são constantes literais cujos valores são seus próprios nomes, como se fossem contanstes em String (os tipos `true`, `false`, e `nil` são `atoms`, porém o Elixir permite que você dispense o uso de `:` para utilizá-los):

```elixir
:jonatas
# :jonatas
```

Os Atoms seguem o formato de caracteres Unicode, então caso precise criar um Atom com espaços por exemplo, pode colocar entre aspas duplas (""):

```elixir
:"um atom com espaço"
# :"um atom com espaço"
```

## Integer

Números inteiros (não frações), incluí números binários, octais e hexadecimais:

exemplo:

```elixir
myAge = 23
# 23
```

```elixir
0b0110
# 6

0o644
# 420

0xff0
# 4080
```

## Float

Números com precisão de ponto flutuante, precisam obrigatóriamente de um um decimal depois de pelo menos um dígito, tem precisão de 64 bits e suportam a keyword `e` para números exponenciais.

Ao realizar uma operação de divisão como `10/5` por exemplo, o resultado é apresentado como `5.0`:

```elixir
10/2
# 5.0
```

```elixir
5.0
```

```elixir
1.0e-10
# 1.0e-10
```

## String

São uma sequência de caracteres em UTF-8 representados sempre com aspas duplas (""):

```elixir
"Hello World!"
# "Hello World!"
```

Para concatenar Strings utilize a keyword `<>`:

```elixir
"Hello" <> " " <> "World!"
# "Hello World!"
```

Para realizar interpolações utilize `#{}`:

```elixir
name = "Jonatas"
"Hello #{name}"
# "Hello Jonatas"
```

## Boolean

Todos os valores são verdadeiros com excessão de `false` e `nil`:

```elixir
estaComFome = true

estaComFome === true
# true

estaComFome === :true
# true
```

```elixir
temDinheiro = false

temDinheiro === true
# false

temDinheiro === :false
# false

temDinheiro === :false
# false

temDinheiro === nil
# true

temDinheiro === :nil
# true
```

## Nil

Representam o valor nulo.

## Métodos de validação is\_{type}

Para checar se determinado valor é de determinado tipo, temos funções auxiliares que retornam TRUE/FALSE.

Exemplos:

```elixir
is_atom(:jonatas)
# true

is_integer(myage)
# true

is_float(10/5)
# true

is_atom(nil)
# true
```

# Diferenças de POO

Uma das diferenças que temos em relação ao POO, é que dificilmente vamos ver algo do tipo:

```js
'Jonatas'.ToUpperCase()
```

No Elixir normalmente chamamos o módulo que precisamos e interagimos com o valor através dos argumentos das funções:

```elixir
String.downcase("Jonatas")
```

## Referências

- [Atom](https://hexdocs.pm/elixir/1.13.3/Atom.html)
- [String](https://hexdocs.pm/elixir/1.13.3/String.html)
- [Integer](https://hexdocs.pm/elixir/1.13.3/Integer.html)
- [Float](https://hexdocs.pm/elixir/1.13.3/Float.html)
- [Basics - Elixir School](https://elixirschool.com/pt/lessons/basics/basics)
