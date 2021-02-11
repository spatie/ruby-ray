require_relative "../origin/origin_factory"

module Ray
  module Payloads
    class Payload

      def initialize(*args) end

      def type
        raise NotImplementedError, 'You must define the `type` method in your Payload'
      end

      def content
        {}
      end

      def to_hash
        {
          type: self.type,
          content: self.content,
          origin: self.get_origin.to_hash
        }
      end

      def get_origin
        Origin::OriginFactory.new.get_origin
      end
    end
  end
end
