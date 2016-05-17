module Api::Views::Fighters
  class Index
    include Api::View
    format :json

    def render
      raw JSON.generate(fighters.map { |fighter| { id: fighter.id, name: fighter.name } })
    end
  end
end
