class Fighter < Sequel::Model
  many_to_one :weapon
end
