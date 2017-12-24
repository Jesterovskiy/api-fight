defmodule PhoenixElixir.FighterTest do
  use PhoenixElixir.ModelCase

  alias PhoenixElixir.Fighter

  @valid_attrs %{klass: "some content", lvl: 42, name: "some content", race: "some content", wins: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Fighter.changeset(%Fighter{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Fighter.changeset(%Fighter{}, @invalid_attrs)
    refute changeset.valid?
  end
end
