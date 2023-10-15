# クロールの定義クラスを格納するディレクトリへのパス
CRAWLER_DIRECTORY = Rails.root.join('app', 'lib', 'recruitment_collector', 'crawler')

class RecruitmentCollector::Crawl
  def initialize
    @crawlers = target_crawlers
  end

  def run
    @crawlers.each do |crawler|
      url_and_html_arr = crawler.collect_url_and_html_arr # サイトごとにクロールを実行し、各ページのURLとHTMLを取得
      url_and_html_arr.each do |url_and_html|
        ScrapedRecruitment.create(url_and_html)
      end
    end
  end

  # 各サイトの定義クラスを取得
  def target_crawlers
    # /crawlerディレクトリ内のRubyファイルを取得
    crawler_files = Dir[File.join(CRAWLER_DIRECTORY, '*.rb')]

    # ファイル名からクラス名を取得
    crawler_names = crawler_files.map do |file|
      File.basename(file, '.rb').classify
    end

    # クローラークラスのインスタンスを生成
    crawler_names.map do |crawler_name|
      "RecruitmentCollector::Crawler::#{crawler_name}".constantize.new
    end
  end
end
