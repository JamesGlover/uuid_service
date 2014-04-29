module UuidService

  module Routing

    class Endpoint
      def initialize(name)
        @name = name
        @accepts = Hash.new { lambda { [406, {"Content-Type" => "application/json"}, ['{"error":"','can only return ',accepted_types.join(','),'"}']] } }
      end

      def get(accepts,&block)
        @accepts[accepts] = block
      end

      def do(accepts)
        @accepts[accepts.best_of(accepted_types)].call()
      end

      def accepted_types
        @accepts.keys
      end
    end

    class UnknownEndpoint
      def do(_)
        [404, {"Content-Type" => "application/json"}, ['{"error":"','page not found','"}']]
      end
    end

    def route(name)
      new_route = register(name)
      yield new_route
    end

    def register(route_name)
      Endpoint.new(route_name).tap do |ep|
        routes[route_name] = ep
      end
    end

    def routes
      @routes ||= Hash.new
    end

    def lookup(route,method,accepts)
      return UnknownEndpoint.new.do(nil) unless method == 'GET'
      ep = routes[route]||UnknownEndpoint.new
      ep.do(accepts)
    end

  end

end
