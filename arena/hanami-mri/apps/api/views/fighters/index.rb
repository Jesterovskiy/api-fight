module Api::Views::Fighters
  class Index
    include Api::View
    format :json

    def render
      raw JSON.generate([{ name: 'John Doe' }, { name: 'Foo Bar' }, { name: 'Sir Gey' }])
    end
  end
end
