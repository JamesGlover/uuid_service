require 'rubygems'
require 'rack'
require 'puma'
require 'uuid_service'
require 'uuid_service/uuid'


run UuidService::Service.new
