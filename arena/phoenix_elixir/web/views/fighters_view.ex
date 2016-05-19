defmodule PhoenixElixir.FightersView do
  use PhoenixElixir.Web, :view

  def render("index.json", %{fighters: fighters}) do
    Enum.map(fighters, fn fighter ->
      %{id: fighter.id, name: fighter.name}
    end)
  end

  def render("show.json", %{fighter: fighter}) do
    %{name: fighter.name, lvl: fighter.lvl, race: fighter.race, klass: fighter.klass, wins: fighter.wins}
  end
end
