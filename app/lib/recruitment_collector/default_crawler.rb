require 'open-uri'
require 'nokogiri'

class RecruitmentCollector::DefaultCrawler
  def initialize
    @home_url = ''  # 個別ページ訪問時に必要なURL
    @site_url = ''  # 募集一覧のURL
    @recruitment_css_selector = '' # 　個別ページへの遷移ボタンcss
    @recruitment_content = '' #  個別ページで必要なhtml範囲指定
  end

  def collect_url_and_html_arr
    result = [] # 結果を格納する配列
    html = URI.open(@site_url).read
    doc = Nokogiri::HTML.parse(html)

    # 個別ページのリンクを集める
    links = doc.css(@recruitment_css_selector)

    links.each do |link|
      # homeのURLとボタンのhrefを組み合わせて個別ページのURLを生成
      page_url = "#{@home_url}#{link['href']}"

      # データベース内で既に同じURLが存在するか確認
      existing_data = ScrapedRecruitment.find_by(url: page_url)

      if existing_data
        puts "URL #{page_url} は既にクロール済みです。スキップします。"
        next # 既存のデータがある場合、次のURLに進む
      end

      # 個別ページのhtmlを取得する
      page_html = URI.open("#{page_url}").read
      page_doc = Nokogiri::HTML.parse(page_html)

      # htmlの範囲を指定する
      content = page_doc.at(@recruitment_content)

      if content
        content_html = content.to_html
        crawled_datetime = Time.now
      else
        puts "指定したセレクタ #{@recruitment_content} が見つかりませんでした。"
      end

      result << { url: page_url, html: content_html, last_crawled_at: crawled_datetime }

      # 1秒間隔で実行
      sleep(1)
    end

    result
  end
end
