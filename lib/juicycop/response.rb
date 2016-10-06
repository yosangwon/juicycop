require 'nokogiri'
require 'rainbow'

module Juicycop
  # 쿼리 결과를 분석하고 출력합니다.
  class Response
    attr_reader :string, :complaints

    def initialize(html_string)
      parser = Nokogiri::HTML(html_string)

      @string = parser.at_css('#bufUnderline').children.map do |dom|
        colorize(dom)
      end.join

      @complaints = parser.css('.tableErrCorrect').map do |dom|
        Juicycop::Complaint.parse(dom)
      end.compact
    end

    def colorize(dom)
      return "\n" if dom.name == 'br'
      case dom.attribute('color').to_s
      when 'red'
        Rainbow(dom.content).red
      when 'Olive'
        Rainbow(dom.content).yellow
      when 'green'
        Rainbow(dom.content).green
      else
        dom.content
      end
    end

    def print
      return if @complaints.length.zero?

      puts @string
      puts "\n상세 검사 결과:\n\n"

      @complaints.each(&:print)
    end
  end
end
