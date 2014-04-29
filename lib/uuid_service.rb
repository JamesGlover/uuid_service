require "uuid_service/version"
require "uuid_service/routing"
require "rack"
require "rack/accept"

module UuidService

  class Service

    extend UuidService::Routing

    route "/" do |r|
      r.get('application/json') { [200, {"Content-Type" => "application/json"}, ['{"uuid":"',UuidService::Uuid.new.value,'"}']] }
    end

    def call(env)
      req = ::Rack::Request.new(env)
      acc = Rack::Accept::MediaType.new(env['HTTP_ACCEPT'])
      Service.lookup(req.path,req.request_method,acc)
    end


  end
end
