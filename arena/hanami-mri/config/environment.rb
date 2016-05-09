require 'rubygems'
require 'bundler/setup'
require 'hanami/setup'
require_relative '../lib/hanami_mri'
require_relative '../apps/api/application'

Hanami::Container.configure do
  mount Api::Application, at: '/'
end
