module Ray
  class Client
    def initialize(port = 23517, host = 'localhost')
      @port = port
      @host = host
    end

    def send(request)
      req = Net::HTTP::Post.new(uri, { 'Content-Type' => 'application/json' })
      req.body = request.to_json

      begin
        res = Net::HTTP.start(uri.hostname, uri.port) do |http|
          http.request(req)
        end
      rescue StandardError
        # Ignore any errors
      end
    end

    def uri
      @uri ||= URI("#{@host}:#{@port}")
    end
  end
end
