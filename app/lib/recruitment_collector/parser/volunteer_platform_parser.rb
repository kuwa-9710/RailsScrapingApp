module RecruitmentCollector
  module Parser
    # ボランティアプラットフォーム用
    class VolunteerPlatformParser < RecruitmentCollector::DefaultParser
      def initialize
        super

        @title_selector = '.contens_sub_inner h2'
        @desc_selector = '#contens_sub_comment dl dd'
        @deadline_selector = '募集期間'
        @organization_name_selector = '名称'
        @organization_email_selector = 'E-mail'
        @organization_phone_number_selector = '.contens_sub_profile table tr:nth-child(3) td'
        @organization_hp_selector = ''
      end

      # タイトル
      def extract_title(html)
        element = html.css(@title_selector)
        return nil if element.empty?

        # タイトルから受付中のspanを除外する
        extracted_title = element.text
        extracted_title.gsub('受付中', ' ').strip
      end

      # 締切
      def extract_deadline(html)
        # thをもとにパスを指定
        th_element = html.at("th:contains('#{@deadline_selector}')")
        return unless th_element

        # tdのテキスト取得
        td_element = th_element.next_element
        td_text = td_element.text

        # 正規表現を使用して "2023年10月27日" を抽出
        date_text = td_text.match(/(\d{4}年\d{1,2}月\d{1,2}日)～(\d{4}年\d{1,2}月\d{1,2}日)/)
        return unless date_text

        date_str = date_text[2]
        # 日本語表記の日付文字列を正規化
        date_str = date_str.gsub(/年|月|日/, '-').gsub(/～/, '')

        # 日付文字列をDate型に変換
        Date.parse(date_str)
      end

      # メール
      def extract_organization_email(html)
        return nil if @organization_email_selector.empty?

        th_element = html.at("th:contains('#{@organization_email_selector}')")
        return unless th_element

        td_element = th_element.next_element.at('a')

        if td_element
          td_element['href'].sub('mailto:', '') # 'mailto:'を削除
        else
          puts 'Eメールアドレスが見つかりません'
        end
      end

      # 電話番号
      def extract_organization_phone_number(html)
        phone_number_text = html.css(@organization_phone_number_selector).text
        phone_number_text.scan(/\d/).join
      end
    end
  end
end
