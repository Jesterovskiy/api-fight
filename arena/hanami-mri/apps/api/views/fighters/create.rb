module Api::Views::Fighters
  class Create
    include Api::View
    format :json

    def render
      raw JSON.generate(fighter.to_hash)
    end
  end
end
