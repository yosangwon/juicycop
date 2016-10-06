require 'net/http'
require 'nokogiri'

module Juicycop
  # 부산대학교/나라인포테크 맞춤법 검사기에 요청을 보내고 파싱합니다.
  class Request
    def initialize(text)
      puts text
    end

    def process
      1
    end
  end
end
