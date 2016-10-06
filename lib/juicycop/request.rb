require 'net/http'
require 'pry'

module Juicycop
  # 부산대학교/나라인포테크 맞춤법 검사기에 요청을 보내고 결과를 모읍니다.
  class Request
    def initialize
      uri = URI.parse BUSAN_SPELLER_URL
      @http = Net::HTTP.new(uri.host, uri.port)
      @request = Net::HTTP::Post.new(uri.request_uri)
    end

    def process(text)
      text.split(/\W{250}/)
          .each_slice(300)
          .map { |words| words.join(' ') }
          .map { |query| request!(query) }
          .select { |response| response.code == '200' }
          .map { |response| Juicycop::Response.new(response.body) }
          .flatten
    end

    private

    def request!(query)
      @request.set_form_data('text1' => query)
      @http.request(@request)
    end
  end
end
