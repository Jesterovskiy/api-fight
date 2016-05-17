module Api::Views::Fighters
  class Show
    include Api::View
    format :json

    def render
      raw JSON.generate(fighter.to_hash)
    end
  end
end
