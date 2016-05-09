require 'hanami/model'
require 'hanami/mailer'
Dir["#{ __dir__ }/hanami_mri/**/*.rb"].each { |file| require_relative file }

Hanami::Model.configure do
  ##
  # Database adapter
  #
  # Available options:
  #
  #  * Memory adapter
  #    adapter type: :memory, uri: 'memory://localhost/hanami_mri_development'
  #
  #  * SQL adapter
  #    adapter type: :sql, uri: 'sqlite://db/hanami_mri_development.sqlite3'
  #    adapter type: :sql, uri: 'postgres://localhost/hanami_mri_development'
  #    adapter type: :sql, uri: 'mysql://localhost/hanami_mri_development'
  #
  adapter type: :sql, uri: ENV['HANAMI_MRI_DATABASE_URL']

  ##
  # Migrations
  #
  migrations 'db/migrations'
  schema     'db/schema.sql'

  ##
  # Database mapping
  #
  # Intended for specifying application wide mappings.
  #
  # You can specify mapping file to load with:
  #
  # mapping "#{__dir__}/config/mapping"
  #
  # Alternatively, you can use a block syntax like the following:
  #
  mapping do
    # collection :users do
    #   entity     User
    #   repository UserRepository
    #
    #   attribute :id,   Integer
    #   attribute :name, String
    # end
  end
end.load!

Hanami::Mailer.configure do
  root "#{ __dir__ }/hanami_mri/mailers"

  # See http://hanamirb.org/guides/mailers/delivery
  delivery do
    development :test
    test        :test
    # production :stmp, address: ENV['SMTP_PORT'], port: 1025
  end
end.load!
