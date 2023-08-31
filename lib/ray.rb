# frozen_string_literal: true

require "net/http"
require "active_support/all"

require_relative "ray/version"
require_relative "ray/request"
require_relative "ray/client"
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
require_relative "ray/payloads/notify_payload"
require_relative "ray/payloads/create_lock_payload"
require_relative "ray/payloads/size_payload"
require_relative "ray/payloads/json_string_payload"
require_relative "ray/payloads/caller_payload"
require_relative "ray/payloads/trace_payload"
require_relative "ray/payloads/log_payload"
require_relative "ray/origin/origin_factory"

require_relative "configuration"

module Ray
  class Ray
    def initialize(settings, client = nil)
      @uuid = SecureRandom.uuid
      @client = client || Client.new(settings[:port], settings[:host])
    end

    def self.configuration
      @configuration ||= Configuration.new
    end
    
    def self.configure(&block)
      yield(configuration)
    end

    def green
      color "green"
    end

    def orange
      color "orange"
    end

    def red
      color "red"
    end

    def purple
      color "purple"
    end

    def blue
      color "blue"
    end

    def gray
      color "gray"
    end

    def small
      size "sm"
    end

    def large
      size "lg"
    end

    def new_screen(name = "")
      payload = Payloads::NewScreenPayload.new(name)

      send_request payload
    end

    def clear_screen
      new_screen
    end

    def notify(text)
      payload = Payloads::NotifyPayload.new(text)

      send_request payload
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

    def size(size)
      payload = Payloads::SizePayload.new(size)

      send_custom payload
    end

    def class_name(anything)
      send_custom(anything.class.to_s, "Class name")
    end

    def caller
      location = caller_locations(2..2).first

      if !location
        payload = Payloads::CustomPayload.new("Called at top level", "Caller")

        send_request payload

        return self
      end

      payload = Payloads::CallerPayload.new(location)

      send_request payload
    end

    def trace
      payload = Payloads::TracePayload.new caller_locations

      send_request payload
    end

    def to_json(*args)
      payloads = args.map do |arg|
        Payloads::JsonStringPayload.new(arg)
      end

      send_request payloads
    end

    def pass(argument)
      send argument

      argument
    end

    def pause
      lock_name = rand(10**12).to_s

      payload = Payloads::CreateLockPayload.new(lock_name)

      send_request payload

      loop do
        sleep(1)
        if !@client.lock_exists lock_name
          break
        end
      end

      self
    end

    def send_custom(content, label = "")
      payload = Payloads::CustomPayload.new(content, label)

      send_request payload
    end

    def send(*args)
      send_request PayloadFactory.create_for_values(args)
    end

    def send_request(payloads)
      payloads = Array(payloads)

      meta = {
        ruby_ray_version: "ray version here"
      }

      request = Request.new(@uuid, payloads, meta)

      @client.send(request)

      self
    end
  end
end

def ray(*args)
  settings = {host: Ray::Ray.configuration.host || "http://localhost", port: Ray::Ray.configuration.port || 23517}

  Ray::Ray.new(settings).send(*args)
end
