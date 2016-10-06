$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'juicycop/version'

Gem::Specification.new do |s|
  s.name = 'juicycop'
  s.version = Juicycop::VERSION
  s.authors = ['이상원']
  s.email = ['public@leo.re.kr']
  s.homepage = 'https://github.com/devleoper/juicycop'
  s.summary = '커맨드라인 한국어 맞춤법 검사기'
  s.description = <<-EOF
부산대학교/나라인포테크 맞춤법 검사기에 요청을 보내
명령행에서 해당 경로 안에 있는 문서의 한국어 맞춤법을
검사할 수 있습니다.

상업적인 목적으로 사용할 때 일어나는 일에 대해서는
개발자는 어떠한 책임도 지지 않습니다.
  EOF
  s.license = 'MIT'

  s.executables << 'juicycop'
  s.files = Dir['{lib}/**/*', 'Rakefile', 'README.md']
  s.add_dependency 'nokogiri', '~> 1.6'
end
