module Api::Controllers::Fighters
  class Index
    include Api::Action
    accept :json

    def call(params)
      self.format = :json
    end
  end
end
