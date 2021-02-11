module Ray
  module Origin
    class Origin

      def initialize(file, lineNumber)
        @file = file
        @lineNumber = lineNumber
      end

      def to_array
        {
          file: @file,
          lineNumber: @lineNumber,
        }
      end
    end
  end
end
