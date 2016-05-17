class FighterRepository
  include Hanami::Repository

  def self.weapon
    binding.pry
    WeaponRepository.query do
      where(id: 1)
    end.all
  end
end
