module Api::Controllers::Fighters
  class Create
    include Api::Action
    accept :json
    expose :fighter

    def call(params)
      self.format = :json
      # test(params)
      @fighter = Fighter.create(params['fighter'])
    end

    def test(params)
      binding.pry
    end
  end
end
