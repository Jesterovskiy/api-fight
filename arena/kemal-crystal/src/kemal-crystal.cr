require "./kemal-crystal/*"
require "kemal"

module Kemal::Crystal
  get "/" do
    "Hello Kemal!"
  end

  Kemal.run
end
