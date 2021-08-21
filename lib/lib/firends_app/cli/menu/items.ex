defmodule FriendsApp.CLI.Menu.Items do
  alias FriendsApp.CLI.Menu

  def all, do: [
    %Menu{label: "Cadastrar um amigo", id: :create},
    %Menu{label: "Lista os amigo", id: :read},
    %Menu{label: "Atualizar um amigo", id: :update},
    %Menu{label: "Exclui um amigo", id: :delete},
  ]
end
