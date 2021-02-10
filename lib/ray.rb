# frozen_string_literal: true

require 'net/http'
require "active_support/all"

require_relative "ray/version"
require_relative "ray/request"
require_relative "ray/payload_factory"
require_relative "ray/payloads/payload"
require_relative "ray/payloads/bool_payload"
require_relative "ray/payloads/int_payload"
require_relative "ray/payloads/null_payload"
require_relative "ray/payloads/string_payload"

module Ray
  mattr_accessor :settings
  @@settings = { host: "http://localhost", port: 23517 }

  class Ray
    attr_reader :settings

    class Error < StandardError; end
    # Your code goes here...

    def initialize(settings)
      @settings = settings
    end

    def send(args)
      send_request PayloadFactory.create_for_values(args)
    end

    def send_request(payloads)
      Request.new(payloads, settings).send
    end
  end
end

def ray(*args)
  Ray::Ray.new(Ray.settings).send(args)
end
