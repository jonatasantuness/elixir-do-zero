# Movimentos dos Players

## Verificando movimentos dos jogadores

Agora começaremos a criar a lógica do jogo de fato como a realização dos ataques.

No módulo principal `ExMon`, vamos criar um método `make_move()` que vai receber um dos movimentos que o player cadastrou para utilizá-lo. Antes de usar o movimento, precisamos checar se ele de fato existe, então para isso, vamo criar outro módulo chamado `Actions`, e la criar uma funação que vai percorrer os movimentos do player para fazer essa validação, no arquivo principal ele será chamado assim:

```elixir
def make_move(move) do
  Actions.fetch_movie(move)
end
```

Crie o arquivo `actions.ex` dentro do diretório `/lib/game/`. Para obter os movimentos do player podemos criar no módulo `ExMon.Game`, um método que retorne o player, já que neste módulo estamos trabalhando com o estado da aplicação.

Para obter os dados do player utilizaremos o `Map.get()` que receberá como parâmetros o dado a ser percorrido, no caso o retorno de `info()`, que é o estado da aplicação, e a chave com o valor que desejamos obter, que é `:player`:

```elixir
defmodule ExMon.Game do
  # code ...
  def player, do: Map.get(info(), :player)
end
```

Porém antes de testar, vamos fazer uma refatoração no estado, ao invés de receber os 3 movimentos do player de maneira separada, podemos recebê-los em um map chamado `moves` e ajustar os parâmetros, então no arquivo `players.ex` altere o Módulo `ExMon.Player` para:

```elixir
defmodule ExMon.Player do
  @required_keys [:life, :moves, :name]
  @max_life 100

  @enforce_keys @required_keys

  defstruct @required_keys

  def build(name, move_rnd, move_avg, move_heal) do
    %ExMon.Player{
      life: @max_life,
      moves: %{
        move_avg: move_avg,
        move_heal: move_heal,
        move_rnd: move_rnd
      },
      name: name
    }
  end
end
```

Com o estado alterado, agora podemos ir no módulo `Actions` e criar as funções validar os movimentos. Neste momento o método `Enum.find_value()` pode ser útil para percorrer o map e localizar o valor, ele recebe 3 argumentos:

1. O valor enumarável que desejamos percorrer, no caso a lista de movimentos.
2. Um retorno padrão caso o que buscamos não seja encontrado, pode ser uma tupla com erro.
3. Uma função anônima com a lógica utilizada para encontrar o valor, neste caso, vamos passar por cada item em `moves` para checar se o valor que o player inseriu existe no map e retornar a sua chave correspondente.

```elixir
defmodule ExMon.Game.Actions do
  alias ExMon.Game

  def fetch_move(move) do
    Game.player()
    |> Map.get(:moves)
    |> find_move(move)
  end

  defp find_move(moves, move) do
    Enum.find_value(moves, {:error, move}, fn {key, value} ->
      if value == move, do: {:ok, key}
    end)
  end
end
```

Aproveite para atualizar o alias de `Actions` no módulo principal:

```elixir
defmodule ExMon do
  alias ExMon.Game.{Actions, Status}

  # code....

  def make_move(move) do
    Actions.fetch_move(move)
  end
end
```

Para testar, compile o projeto e execute o método `make_move()`:

```sh
player_jonatas = ExMon.create_player("Jonatas", "Kick", "Water Gun", "Water Heal")

ExMon.start_game(player_jonatas)

ExMon.make_move("Kick")
# {:ok, :move_rnd}
```

## Selecionando o movimento de cura e ataque

Uma vez válidado o movimento, agora podemos fazer a lógica do movimento de ataque, no módulo principal, já temos a função `make_move()` que inicia o movimento, no método `Actions.fetch_move()` é retornando uma tupla de erro ou a chave correspondente do movimento, então podemos aproveitar esse retorno, no módulo `Status` crie uma função para retornar uma mensagem amigável quando o movimento inserido não é válido:

```elixir
defmodule ExMon.Game.Status do
  # code ...
  def print_wrong_move_message(move) do
    IO.puts("\n===== Movimento #{move} é inválido =====\n")
  end
end
```

E na função `make_move()` inicie uma pipe com uma nova função `do_move()` para retornar a lógica do movimento, essa função deve ser configurada para receber um erro, ou movimento válido. Se a função receber um erro, vai rodar a função `Status.print_wrong_move_message()` para exibir uma mensagem para o usário, e se receber um movimento válido vai entrar num bloco `case` para verificar qual tipo de movimento, então temos outra validação, se o movimento for de cura executa algo para a cura e se for de ataque vamos criar outra função em `Actions` chamada `Actions.attack(move)`:

```elixir
def make_move(move) do
  move
  |> Actions.fetch_move()
  |> do_move()
end

defp do_move({:error, move}), do: Status.print_wrong_move_message(move)

defp do_move({:ok, move}) do
  case move do
    :move_heal -> "Realiza a cura"
    move -> Actions.attack(move)
  end
end
```

Quando o método `Actions.attack()` é chamado, não sabemos se o movimento passado é do player humano ou do computador, para obter essa informação, podemos utilizar o turno, que está na propriedade `turn` do nosso estado, logo se o turno é do player humano, quem está atacando é o computador.

Da mesma forma que criamos uma função `player` para obter os dados do jogador no módulo `Game`, vamo criar uma função chamada `turn` para pegar o turno do estado:

```elixir
defmodule ExMon.Game do
  # code ...
  def turn, do: Map.get(info(), :turn)
end
```

Dentro do diretório `/lib/game` crie outro diretório chamado `/actions` e um arquivo `attack.ex`, nele crie a função `attack_opponent()` que vai receber como argumento o oponente (jogador ou computador), e o movimento. A primeira coisa que devemos fazer é calcular os pontos do movimento, pois lembrando, os movimentos de ataque podem variar os números de pontos.

No Elixir existe o conceito de range, então nas variáveis de módulo que receberão os níveis de poder dos movimentos, podemos inserir um range com a keyword `..`, que basicamente cria uma lista com os valores dentro desse range, e em conjunto com o método Enum.random() o valor do poder do movimento será sorteado com base no range:

```elixir
@move_avg_power 18..25
# [18, 19, 20, 21, 22, 23, 24, 25]
```

```elixir
defmodule ExMon.Game.Actions.Attack do
  @move_avg_power 18..25
  @move_rnd_power 10..35

  def attack_opponent(opponent, move) do
    damage = calculate_power(move)
  end

  defp calculate_power(:move_avg), do: Enum.random(@move_avg_power)
  defp calculate_power(:move_rnd), do: Enum.random(@move_rnd_power)
end
```

## Gerando o valor de vida resultante

Para calcular o valor de vida restante, precisamos primeiro saber qual o valor da vida atual do player, para isso podemos colocar no módulo `Game` uma função para obter os dados do jogador com base no parâmetro `opponent`:

```elixir
defmodule ExMon.Game do
  # code ...
  def fetch_player(player), do: Map.get(info(), player)
end
```

Com o player selecionado em mãos, inicie uma pipe na função `attack_opponent()`, a função
`calculate_total_life()` será responsável por calcular o dano, lembrando que não existe vida negativa, então se for menor que será retornará 0 mesmo, e a função `update_opponent_life()` será responsável por atualizar o estado deste player:

```elixir
defmodule ExMon.Game.Actions.Attack do
  alias ExMon.Game

  # code...

  def attack_opponent(opponent, move) do
    damage = calculate_power(move)

    opponent
    |> Game.fetch_player()
    |> Map.get(:life)
    |> calculate_total_life(damage)
    |> update_opponent_life(opponent)
  end

  # code...

  defp calculate_total_life(life, damage) when life - damage < 0, do: 0
  defp calculate_total_life(life, damage), do: life - damage

  defp update_opponent_life(life, opponent) do
    opponent
    |> Game.fetch_player()
    |> Map.put(:life, life)
  end
end
```

Quando utilizamos o `Map.put()` para setar o novo valor de vida do player, o terminal retorna este player no formato de Struct dele e com a vida atalizada, porém se rodarmos o comando de ataque novamente, ele sempre fará o cálculo a partir do máximo de vida que é `100`, isso por causa da imutabilidade, nós não alteramos o valor de fato somente com o `Map.put()`.

O `Agent` permite a criação de uma função de update, essa função vai receber 2 argumentos:

1. O Agent, que no caso é o nome do próprio módulo.
2. Uma função anônima que tem como argumento o estado anterior, porém como não vamos utilizar o estado anterior e somente sobreescrevê-lo, então podemos ignorar esse argumento com `_` e só retornar o novo estado.

```elixir
defmodule ExMon.Game do
  use Agent

  # code ...
  def update(state) do
    Agent.update(__MODULE__, fn _ -> state end)
  end
  # code ...
end
```

Agora no módulo de `Attack` já é possível utilizar uma função `update_game` que sobreescreva o estado da aplicação quando a função for `update_opponent_life()` for acionada:

```elixir
defmodule ExMon.Game.Actions.Attack do
  # code ...

  defp update_opponent_life(life, opponent) do
    opponent
    |> Game.fetch_player()
    |> Map.put(:life, life)
    |> update_game(opponent)
  end

  defp update_game(player, opponent) do
    Game.info()
    |> Map.put(opponent, player)
    |> Game.update()
  end
end
```

como o estado foi alterado, então se faze necessárop atualizar também as propriedades `turn` e `status`