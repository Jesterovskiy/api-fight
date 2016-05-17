class Weapon < Sequel::Model
  one_to_one :fighter
end
