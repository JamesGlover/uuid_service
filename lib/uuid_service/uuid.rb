require 'uuidtools'

module UuidService
  class Uuid

    attr_reader :value

    def initialize
      @value = UUIDTools::UUID.timestamp_create.to_s
    end

  end
end
