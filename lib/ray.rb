# frozen_string_literal: true

require 'net/http'
require "active_support/all"

require_relative "ray/version"
require_relative "ray/request"
require_relative "ray/payload_factory"
require_relative "ray/payloads/payload"
require_relative "ray/payloads/bool_payload"
require_relative "ray/payloads/color_payload"
require_relative "ray/payloads/int_payload"
require_relative "ray/payloads/null_payload"
require_relative "ray/payloads/string_payload"
require_relative "ray/payloads/new_screen_payload"
require_relative "ray/payloads/hide_payload"
require_relative "ray/payloads/hide_app_payload"
require_relative "ray/payloads/remove_payload"
require_relative "ray/payloads/show_app_payload"
require_relative "ray/payloads/custom_payload"

module Ray
  mattr_accessor :settings
  @@settings = { host: "http://localhost", port: 23517 }

  class Ray
    attr_reader :settings

    class Error < StandardError; end

    def initialize(settings)
      @settings = settings
      @uuid = SecureRandom.uuid
    end

    def green
      color 'green'
    end

    def orange
      color 'orange'
    end

    def red
      color 'red'
    end

    def purple
      color 'purple'
    end

    def blue
      color 'blue'
    end

    def gray
      color 'gray'
    end

    def new_screen(name = '')
      payload = Payloads::NewScreenPayload.new(name)

      send_request payload
    end

    def clear_screen
      self.new_screen
    end

    def hide
      payload = Payloads::HidePayload.new

      send_request payload
    end

    def remove
      payload = Payloads::RemovePayload.new

      send_request payload
    end

    def hide_app
      payload = Payloads::HideAppPayload.new

      send_request payload
    end

    def show_app
      payload = Payloads::ShowAppPayload.new

      send_request payload
    end

    def color(color)
      payload = Payloads::ColorPayload.new(color)

      send_request payload
    end

    def send_custom(content, label = '')
      payload = Payloads::CustomPayload.new(content, label)

      send_request payload
    end

    def send(*args)
      send_request PayloadFactory.create_for_values(args)
    end

    def send_request(payloads)
      payloads = Array(payloads)

      Request.new(@uuid, payloads, settings).send

      return self
    end
  end
end

def ray(*args)
  Ray::Ray.new(Ray.settings).send(*args)
end
