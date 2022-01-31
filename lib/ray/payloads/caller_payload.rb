module Ray
  module Payloads
    class CallerPayload < Payload
      def initialize(location)
        @location = location
      end

      def type
        "caller"
      end

      def content
        {
          frame: {
            file_name: @location.absolute_path,
            line_number: @location.lineno,
            vendor_frame: false
          }
        }
      end
    end
  end
end
