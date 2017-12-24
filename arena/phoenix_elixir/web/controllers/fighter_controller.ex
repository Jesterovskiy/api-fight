defmodule PhoenixElixir.FighterController do
  use PhoenixElixir.Web, :controller

  alias PhoenixElixir.Fighter

  def index(conn, _params) do
    fighters = Repo.all(Fighter)
    render(conn, "index.json", fighters: fighters)
  end

  def create(conn, %{"fighter" => fighter_params}) do
    changeset = Fighter.changeset(%Fighter{}, fighter_params)

    case Repo.insert(changeset) do
      {:ok, fighter} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", fighter_path(conn, :show, fighter))
        |> render("show.json", fighter: fighter)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(PhoenixElixir.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    fighter = Repo.get!(Fighter, id)
    render(conn, "show.json", fighter: fighter)
  end

  def update(conn, %{"id" => id, "fighter" => fighter_params}) do
    fighter = Repo.get!(Fighter, id)
    changeset = Fighter.changeset(fighter, fighter_params)

    case Repo.update(changeset) do
      {:ok, fighter} ->
        render(conn, "show.json", fighter: fighter)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(PhoenixElixir.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    fighter = Repo.get!(Fighter, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(fighter)

    send_resp(conn, :no_content, "")
  end
end
