require 'rubygems'
require 'rack'
require 'jruby-rack'
require 'lib/uuid_service'
require 'lib/uuid_service/uuid'


run UuidService::Service.new
