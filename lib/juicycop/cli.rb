module Juicycop
  # 명령행 인터페이스
  class CLI
    def run
      target_files.map do |target|
        target_file = File.read(target)
        request = Juicycop::Request.new(target_file)
        request.process
      end.compact.inject(:+)
    end

    def target_files
      Dir.glob(["#{Dir.pwd}/**/*.md"], File::FNM_DOTMATCH)
    end
  end
end
