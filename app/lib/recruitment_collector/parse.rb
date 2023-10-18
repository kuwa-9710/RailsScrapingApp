class RecruitmentCollector::Parse
  def initialize
    @target_recruitments = ScrapedRecruitment.need_to_parse # パース対象募集のみ抽出
  end

  def run
    @target_recruitments.find_each do |recruitment|
      @parser = RecruitmentCollector::ParserFetcher.new.run(recruitment) # 各情報に応じた定義クラス（〇〇ｐarser）を取得
      data = @parser.make_parsed_params(recruitment) # HTMLを解析し、各項目を抽出（戻り値イメージ： {title: 〇〇, kind: 〇〇, user_name: 〇〇, ・・・}）
      recruitment.update(data)
    end
  end
end
