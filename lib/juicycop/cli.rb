module Juicycop
  # 명령행 인터페이스
  class CLI
    def run
      request = Juicycop::Request.new

      responses = target_files.map do |target|
        target_file = File.read(target)
        [target, request.process(target_file)]
      end.to_h

      total_err_count = responses.map do |filename, results|
        print "#{filename}\" 파일 맞춤법 검사 결과:\n\n"

        err_count = results.map do |result|
          result.print
          result.complaints.length
        end.inject(:+)

        print "  맞춤법과 문법 오류를 찾지 못했습니다!\n\n" if err_count&.zero?
        print "---------------- 8< ----------------\n\n"

        err_count
      end.compact.inject(:+)

      puts '결과'
      puts "  #{target_files.length}개 파일 검사"
      puts "  총 #{total_err_count}개 맞춤법과 문법 오류 발견"

      total_err_count.zero?
    end

    def target_files
      Dir.glob(["#{Dir.pwd}/**/*.md"], File::FNM_DOTMATCH)
    end
  end
end
