module Ray
  module Payloads
    class TracePayload < Payload

      def initialize(locations)
        @locations = locations
      end

      def type
        'trace'
      end

      def content
        frames = @locations.map do |location|
          {
            file_name: location.absolute_path,
            line_number: location.lineno,
            vendor_frame: false,
          }
        end

        { frames: frames }
      end

    end
  end
end
