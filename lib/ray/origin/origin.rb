module Ray
  module Origin
    class Origin
      def initialize(file, line_number)
        @file = file
        @line_number = line_number
      end

      def to_hash
        {
          file: @file,
          line_number: @line_number
        }
      end
    end
  end
end
