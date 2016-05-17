module Api::Controllers::Fighters
  class Show
    include Api::Action
    accept :json
    expose :fighter

    def call(params)
      self.format = :json
      @fighter = Fighter[params[:id].to_s]
    end
  end
end
