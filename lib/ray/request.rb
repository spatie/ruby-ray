module Ray
  class Request
    def initialize(uuid, payloads, meta = {})
      @uuid = uuid
      @payloads = payloads
      @meta = meta
    end

    def to_json
      {uuid:@uuid, payloads:payload_contents, meta: @meta}.to_json
    end

    def payload_contents

      return @payloads.map do |payload|
        payload.to_hash
      end
    end
  end
end
