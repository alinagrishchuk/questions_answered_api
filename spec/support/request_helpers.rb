module Requests
  module JsonHelpers
    HEADERS = { 'Content-Type' => 'application/vnd.api+json' }.freeze

    def parsed_response
      @parsed_response ||= JSON.parse(response.body)
    end

    def parsed_response_data
      @parsed_response_data ||= parsed_response['data']
    end

    def build_jsonapi_parameters(attributes, type)
      { data: { attributes:, "type": type } }.to_json
    end
  end
end

RSpec.configure do |config|
  config.include Requests::JsonHelpers
end
