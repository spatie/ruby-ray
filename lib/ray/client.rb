require_relative "errors/stop_execution_requested"

module Ray
  class Client
    def initialize(port = 23517, host = "localhost")
      @port = port
      @host = host
    end

    def send(request)
      req = Net::HTTP::Post.new(uri, {"Content-Type" => "application/json"})
      req.body = request.to_json

      begin
        Net::HTTP.start(uri.hostname, uri.port) do |http|
          http.request(req)
        end
      rescue
        # Ignore any errors
      end
    end

    def lock_exists(lock_name)
      req = Net::HTTP::Get.new("/locks/#{lock_name}", {"Content-Type" => "application/json"})

      begin
        response = Net::HTTP.start(uri.hostname, uri.port) do |http|
          http.request(req)
        end
      rescue
        return false
      end

      result = JSON.parse(response.body)

      if result["stop_execution"]
        raise new StopExecutionRequested
      end

      result["active"] || false
    end

    def uri
      @uri ||= URI("#{@host}:#{@port}")
    end
  end
end
