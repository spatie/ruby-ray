require_relative "origin"

module Ray
  module Origin
    class OriginFactory
      def get_origin
        location = self.get_location

        Origin.new(
          location ? location[:path] : nil,
          location ? location[:lineno] : nil,
        )
      end

      def get_location
        {path: 'myPath', lineno: 123}
      end
    end
  end
end