module Ray
  class PayloadFactory
    attr_reader :arg

    def self.create_for_values(args)
      args.map do |arg|
        new(arg).get_payload
      end
    end

    def initialize(arg)
      @arg = arg
    end

    def get_payload
      case arg
      when Integer
        Payloads::IntPayload.new(arg)
      when NilClass
        Payloads::NullPayload.new(arg)
      when TrueClass, FalseClass
        Payloads::BoolPayload.new(arg)
      when String
        Payloads::StringPayload.new(arg)
      else
        raise StandardError, "Unable to match payload type"
      end
    end
  end
end
