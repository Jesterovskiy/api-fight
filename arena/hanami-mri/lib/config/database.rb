require 'sequel'

DB = Sequel.connect(
  ENV['HANAMI_MRI_DATABASE_URL'],
  max_connections: 10
)
