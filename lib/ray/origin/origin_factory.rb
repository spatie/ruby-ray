require_relative "origin"

module Ray
  module Origin
    class OriginFactory
      def get_origin
        location = self.get_location

        Origin.new(
          location ? location.absolute_path: nil,
          location ? location.lineno : nil,
        )
      end

      def get_location
        caller_locations.find { |location| ! location.path.include? "ruby-ray/lib" }
      end
    end
  end
end