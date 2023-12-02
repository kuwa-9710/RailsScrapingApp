module RecruitmentCollector
  # どのParserを使うかを選択
  class ParserFetcher
    def run(recruitment)
      url = recruitment.url
      host = URI.parse(url).host

      parser_class_name = "#{host.gsub(/[^a-zA-Z0-9]/, '_').split('_').map(&:capitalize).join}Parser"

      begin
        parser_class = RecruitmentCollector::Parser.const_get(parser_class_name)
      rescue NameError
        puts "#{parser_class_name}が見つかりませんでした。"
        parser_class = RecruitmentCollector::Parser::DefaultParser
      end

      parser_class.new
    end
  end
end
