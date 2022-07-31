defmodule ExMon.Game.Status do
  alias ExMon.Game

  def print_round_message do
    IO.puts("\n===== O jogo começou! =====\n")
    IO.inspect(Game.info())
    IO.puts("\n---------------------------")
  end

  def print_wrong_move_message(move) do
    IO.puts("\n===== Movimento #{move} é inválido =====\n")
  end

  def print_move_message(:computer, :attack, damage) do
    IO.puts("\n===== Você atacou o oponente com #{damage} de dano! =====\n")
  end

  def print_move_message(:player, :attack, damage) do
    IO.puts("\n===== O oponente te atacou com #{damage} de dano! =====\n")
  end
end
