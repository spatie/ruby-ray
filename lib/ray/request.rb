module Ray
  class Request
    attr_reader :payloads, :settings

    def initialize(uuid, payloads, settings)
      @uuid = uuid;
      @payloads = payloads
      @settings = settings
    end

    def send
      req = Net::HTTP::Post.new(uri, {'Content-Type' => 'application/json'})
      req.body = { uuid: @uuid, payloads: payloads_content, meta: {} }.to_json
      res = Net::HTTP.start(uri.hostname, uri.port) do |http|
        http.request(req)
      end
    #rescue StandardError
      # Ignore any errors
    end

    def uri
      @uri ||= URI("#{settings[:host]}:#{settings[:port]}")
    end

    def payloads_content
      payloads.map do |payload|
        {
          type: payload.type,
          content: payload.content,
          origin: {
            file: "the file",
            line_number: "123"
          },
        }
      end
    end
  end
end
