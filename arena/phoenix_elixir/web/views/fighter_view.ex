defmodule PhoenixElixir.FighterView do
  use PhoenixElixir.Web, :view

  def render("index.json", %{fighters: fighters}) do
    %{data: render_many(fighters, PhoenixElixir.FighterView, "fighter.json")}
  end

  def render("show.json", %{fighter: fighter}) do
    %{data: render_one(fighter, PhoenixElixir.FighterView, "fighter.json")}
  end

  def render("fighter.json", %{fighter: fighter}) do
    %{id: fighter.id,
      name: fighter.name,
      lvl: fighter.lvl,
      race: fighter.race,
      klass: fighter.klass,
      wins: fighter.wins}
  end
end
