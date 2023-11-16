require 'nokogiri'

module RecruitmentCollector
  # 標準のParser
  class DefaultParser
    def initialize
      # コメントされている箇所以外はcssセレクタを指定
      @title_selector = ''
      @desc_selector = ''
      @deadline_selector = '' # 対になっている要素のtextを指定
      @organization_name_selector = '' # 対になっている要素のtextを指定(ex: tdが欲しい場合、thのtext'主催団体'を指定)
      @organization_email_selector = ''
      @organization_phone_number_selector = ''
      @organization_hp_selector = ''
    end

    def make_parsed_params(recruitment)
      html_string = recruitment.html
      html = Nokogiri::HTML(html_string)

      {
        title: extract_title(html),
        description: extract_description(html),
        deadline: extract_deadline(html),
        organization_name: extract_organization_name(html),
        organization_email: extract_organization_email(html),
        organization_phone_number: extract_organization_phone_number(html),
        organization_hp: extract_organization_hp(html),
        last_parsed_at: Time.now
      }
    end

    # タイトル
    def extract_title(html)
      return nil if @title_selector.empty? # selectorが空の場合はnil

      html.css(@title_selector).text
    end

    # 説明
    def extract_description(html)
      return nil if @desc_selector.empty?

      html.css(@desc_selector).text
    end

    # 締切
    def extract_deadline(html)
      th_element = html.at("th:contains('#{@deadline_selector}')")
      return unless th_element

      td_element = th_element.next_element
      td_element.text
    end

    # 団体名
    def extract_organization_name(html)
      return nil if @organization_name_selector.empty?

      name_element = html.at("th:contains('#{@organization_name_selector}')")
      return unless name_element

      name_element.next_element.at('a').text
    end

    # メールアドレス
    def extract_organization_email(html)
      return nil if @organization_email_selector.empty?

      html.css(@organization_email_selector).text
    end

    # 電話番号
    def extract_organization_phone_number(html)
      return nil if @organization_phone_number_selector.empty?

      html.css(@organization_phone_number_selector).text
    end

    # ホームページ
    def extract_organization_hp(html)
      return nil if @organization_hp_selector.empty?

      html.css(@organization_hp_selector).text
    end
  end
end
