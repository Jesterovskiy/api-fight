module Api::Controllers::Fighters
  class Index
    include Api::Action
    accept :json
    expose :fighters

    def call(params)
      self.format = :json
      @fighters = Fighter.all
    end
  end
end
