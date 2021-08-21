defmodule FriendsApp.DB.CSV do
  alias Mix.Shell.IO, as: Shell
  alias FriendsApp.CLI.Menu

  def perform(chosen_menu_item) do
    case chosen_menu_item do
      %Menu{label: _, id: :create} -> Shell.info(">> Create")
      %Menu{label: _, id: :read} -> Shell.info(">> Read")
      %Menu{label: _, id: :update} -> Shell.info(">> Update")
      %Menu{label: _, id: :delete} -> Shell.info(">> Delete")
    end
  end

end
