defmodule FriendsApp do
  def hello do
    :world
  end

  def meu_ambiente do
    case Mix.env() do
      :prod -> "Produção"
      :dev -> "Desenvolvimento"
      :test -> "Teste"
    end
  end
end
