defmodule PhoenixElixir.FighterControllerTest do
  use PhoenixElixir.ConnCase

  alias PhoenixElixir.Fighter
  @valid_attrs %{klass: "some content", lvl: 42, name: "some content", race: "some content", wins: 42}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, fighter_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    fighter = Repo.insert! %Fighter{}
    conn = get conn, fighter_path(conn, :show, fighter)
    assert json_response(conn, 200)["data"] == %{"id" => fighter.id,
      "name" => fighter.name,
      "lvl" => fighter.lvl,
      "race" => fighter.race,
      "klass" => fighter.klass,
      "wins" => fighter.wins}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, fighter_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, fighter_path(conn, :create), fighter: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Fighter, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, fighter_path(conn, :create), fighter: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    fighter = Repo.insert! %Fighter{}
    conn = put conn, fighter_path(conn, :update, fighter), fighter: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Fighter, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    fighter = Repo.insert! %Fighter{}
    conn = put conn, fighter_path(conn, :update, fighter), fighter: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    fighter = Repo.insert! %Fighter{}
    conn = delete conn, fighter_path(conn, :delete, fighter)
    assert response(conn, 204)
    refute Repo.get(Fighter, fighter.id)
  end
end
