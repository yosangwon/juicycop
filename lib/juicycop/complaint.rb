module Juicycop
  # 맞춤법 위반 사례
  class Complaint
    attr_reader :input, :suggestion, :help

    def self.parse(complaint_node)
      input = complaint_node.at_css('.tdErrWord').content
      suggestion = complaint_node.at_css('.tdReplace').content
      help = complaint_node.at_css('.tdETNor').children
                           .detect { |n| n.name != 'br' }
                           .content
      return nil if skippable?(help)
      new(input, suggestion, help)
    end

    def self.skippable?(text)
      SKIP_STRINGS.any? { |string| text.include? string }
    end

    def initialize(input, suggestion, help)
      @input = input
      @suggestion = suggestion
      @help = help
    end

    def print
      puts "  #{Rainbow(@input).red} -> #{Rainbow(@suggestion).green}\n"
      puts "    #{@help}\n\n"
    end
  end
end
