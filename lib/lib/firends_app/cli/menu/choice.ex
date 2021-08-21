defmodule FriendsApp.CLI.Menu.Choice do
  alias Mix.Shell.IO, as: Shell
  alias FriendsApp.CLI.Menu.Items

  def start do
    Shell.cmd("clear")
    Shell.info("Escolha uma opção: ")

    menu_items = Items.all()

    find_menu_item_by_index = &Enum.at(menu_items, &1, :error)

    menu_items
    |> Enum.map(&(&1.label))
    |> display_options()
    |> generate_questions()
    |> Shell.prompt()
    |> parse_anwser()
    |> find_menu_item_by_index.()
    |> confirm_menu_item()
  end

  defp confirm_menu_item(chosen_item) when chosen_item == :error  do
    invalid_option()
  end

  defp confirm_menu_item(chosen_item) do
    Shell.cmd("clear")
    Shell.info("Você escolheu... [#{chosen_item.label}]")

    if Shell.yes?("Confirma?") do
      Shell.info("... #{chosen_item.label} ...")
    else
      start()
    end
  end

  defp parse_anwser(anwser) do
    case Integer.parse(anwser) do
      :error -> invalid_option()
      {option, _} -> option-1
    end
  end

  defp invalid_option do
    Shell.cmd("clear")
    Shell.error("Opção inválida!")
    Shell.prompt("Pressione ENTER para tentar novamente...")
    start()
  end


  defp generate_questions(options) do
    formated_options = 1..Enum.count(options)
    |> Enum.join(",")

    "Qual das opções acima você vai escolher ? [#{formated_options}]\n"
  end

  defp display_options(options) do
    options
    |> Enum.with_index(1)
    |> Enum.each(fn {option,index} ->
      Shell.info("#{index} - #{option}")
    end)
    options
  end

end
