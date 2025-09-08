require_relative "origin"

module Ray
  module Origin
    class OriginFactory
      def get_origin
        location = get_location
        Origin.new(location&.absolute_path, location&.lineno)
      end

      def get_location
        caller_locations.find { |location| !location.path.include? "ruby-ray/lib" }
      end
    end
  end
end
