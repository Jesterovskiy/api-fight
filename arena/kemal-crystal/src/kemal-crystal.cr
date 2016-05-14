require "./kemal-crystal/*"
require "kemal"
require "json"

module Kemal::Crystal
  get "/api/v1/fighters" do |env|
    env.response.content_type = "application/json"
    [{name: "John Doe"}, {name: "Foo Bar"}, {name: "Sir Gey"}].to_json
  end

  Kemal.run
end
