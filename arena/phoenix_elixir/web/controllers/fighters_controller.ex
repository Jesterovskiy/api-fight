defmodule PhoenixElixir.FightersController do
  use PhoenixElixir.Web, :controller
  alias PhoenixElixir.Fighter

  plug :scrub_params, "fighter" when action in [:create]
  plug :action

  def index(conn, _params) do
    fighters = Repo.all(Fighter)
    render conn, "index.json", fighters: fighters
  end

  def show(conn, %{"id" => id}) do
    fighter = Repo.get(Fighter, id)
    render conn, "show.json", fighter: fighter
  end

  def create(conn, %{"fighter" => fighter_params}) do
    changeset = Fighter.changeset(%Fighter{}, fighter_params)

    if changeset.valid? do
      fighter = Repo.insert(changeset)
      render conn, "show.json", fighter: List.last(Tuple.to_list(fighter))
    else
      conn
      |> put_status(:unprocessable_entity)
    end
  end
end
