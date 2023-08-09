require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'nokogiri', '~> 1.13'
  gem 'pry-byebug', '~> 3.9'
end

require 'open-uri'

html = URI.open('https://www.tribunaliberal.com.br/pdf-da-edicao').read
parser = Nokogiri::HTML.parse(html)
latest_issue = parser.css('.categoti-content-area .single-news')[0].css('a')[0][:href]

html = URI.open(latest_issue).read
parser = Nokogiri::HTML.parse(html)

issue_date = parser.css('.single-news a')[0].text.strip.gsub("/", "-")
issue_date = Date.parse(issue_date).strftime('%Y-%m-%d')

pdf_issue = parser.css('.single-news a').find do |link|
  link[:href].include?("https://www.tribunaliberal.com.br/assets/images/post/printed")
end[:href]

file = "issues/#{issue_date}.pdf"
`touch #{file}`
IO.binwrite(file, URI.open(pdf_issue).read)
