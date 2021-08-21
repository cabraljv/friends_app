defmodule FriendsApp.DB.CSV do
  alias Mix.Shell.IO, as: Shell
  alias FriendsApp.CLI.Menu
  alias FriendsApp.CLI.Friend
  alias NimbleCSV.RFC4180, as: CSVParser

  def perform(chosen_menu_item) do
    case chosen_menu_item do
      %Menu{label: _, id: :create} -> create()
      %Menu{label: _, id: :read} -> Shell.info(">> Read")
      %Menu{label: _, id: :update} -> Shell.info(">> Update")
      %Menu{label: _, id: :delete} -> Shell.info(">> Delete")
    end
    Menu.Choice.start()
  end

  defp create do
    collect_data()
    |> Map.values()
    |> wrap_in_list()
    |> CSVParser.dump_to_iodata()
    |> save_csv_file()
  end

  defp collect_data do
    Shell.cmd("clear")
    %Friend{
      name: prompt_message("Digite o nome: "),
      phone: prompt_message("Digite o telefone: "),
      email: prompt_message("Digite o email: ")
    }
  end

  defp wrap_in_list(list) do
    [list]
  end

  defp prompt_message(message) do
    Shell.prompt(message)
    |> String.trim()
  end

  defp save_csv_file(data) do
    File.write!("#{File.cwd!}/friends.csv",data, [:append])
  end

end
