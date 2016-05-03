ExUnit.start

Mix.Task.run "ecto.create", ~w(-r PhoenixElixir.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r PhoenixElixir.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(PhoenixElixir.Repo)

