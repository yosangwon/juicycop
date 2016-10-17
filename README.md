# Juicycop

A Korean Spelling checker for markdown for command line interfaces or CIs. (in fact, it queries [Pusan University Korean Spelling Checker](http://speller.cs.pusan.ac.kr).)

커맨드라인과 CI에서 마크다운 문서를 간편하게 한국어 맞춤법 검사 할 수 있게 해주는 도구. [부산대학교/나라인포테크 맞춤법 검사기](http://speller.cs.pusan.ac.kr)에 직접 쿼리를 전송해 결과를 커맨드 라인에 보여줍니다.

**DISCLAIMER: DO NOT USE THIS ON YOUR COMMERCIAL OR PRIVATE PROJECT.**

**주의: 상업적 목적이나 비공개적 목적으로 사용하는 경우에 일어나는 일에 대해서 책임지지 않습니다.**

[![Build Status](https://travis-ci.org/devleoper/juicycop.svg?branch=master)](https://travis-ci.org/devleoper/juicycop)

## Requirements

Ruby 2.3 or higher.

루비 2.3 버전 이상이 필요합니다.

## Installation

```shell
$ git clone git@github.com:devleoper/juicycop.git
$ #    (or) https://github.com/devleoper/juicycop
$ cd juicycop
$ gem build juicycop.gemspec
$ gem install juicycop-x.x.x.gem
```

## Usage

```shell
$ juicycop
```

## LICENSE

MIT
