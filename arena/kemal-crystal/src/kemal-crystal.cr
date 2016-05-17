require "./kemal-crystal/*"
require "kemal"
require "json"
require "pg"
require "pool/connection"

DB = ConnectionPool.new(capacity: 25, timeout: 0.01) do
  PG.connect("postgres://rails@localhost:5432/arena")
end

module Kemal::Crystal
  get "/api/v1/fighters" do |env|
    env.response.content_type = "application/json"
    conn = DB.checkout
    fighters = conn.exec({Int32, String}, "SELECT id, name FROM fighters")
    DB.checkin(conn)
    fighters.to_hash.to_json
  end

  get "/api/v1/fighters/:id" do |env|
    env.response.content_type = "application/json"
    conn = DB.checkout
    fighters = conn.exec(
      {Int32, String, Int32, String, String, Int32, Int32},
      "SELECT * FROM fighters WHERE id = $1", [env.params.url["id"]]
    )
    DB.checkin(conn)
    fighters.to_hash.first.to_json
  end

  post "/api/v1/fighters" do |env|
    env.response.content_type = "application/json"
    conn = DB.checkout
    fighter_params = env.params.json["fighter"] as Hash
    name = fighter_params["name"] as String
    lvl = fighter_params["lvl"] as Int
    race = fighter_params["race"] as String
    klass = fighter_params["klass"] as String
    wins = fighter_params["wins"] as Int
    conn.exec("INSERT INTO fighters (name, lvl, race, klass, wins) VALUES ('#{name}', '#{lvl}', '#{race}', '#{klass}', '#{wins}')")
    fighters = conn.exec(
      {String, Int32, String, String, Int32},
      "SELECT name, lvl, race, klass, wins FROM fighters ORDER BY id DESC LIMIT 1"
    )
    DB.checkin(conn)
    fighters.to_hash.first.to_json
  end

  Kemal.run
end
