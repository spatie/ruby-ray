module Ray
  module Origin
    class Origin

      def initialize(file, lineNumber)
        @file = file
        @lineNumber = lineNumber
      end

      def to_hash
        {
          file: @file,
          line_number: @lineNumber,
        }
      end
    end
  end
end
