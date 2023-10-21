class RecruitmentCollector::ParserFetcher
  def run(recruitment)
    url = recruitment.url
    host = URI.parse(url).host

    case host # host名からParserを指定
    when 'b.volunteer-platform.org'
      puts "VolunteerPlatformParserをインスタンス化します"
      RecruitmentCollector::Parser::VolunteerPlatformParser.new
    when 'spovol.net'
      puts "SpovolParserをインスタンス化します"
      RecruitmentCollector::Parser::SpovolParser.new
    end
  end
end
