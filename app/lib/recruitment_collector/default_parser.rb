require 'nokogiri'

class
   RecruitmentCollector::DefaultParser
  def initialize
    @title_selector = ''
    @desc_selector = ''
    @deadline_selector = ''
    @organization_name_selector = ''
    @organization_email_selector = ''
    @organization_phone_number_selector = ''
    @organization_hp_selector = ''
  end

  def make_parsed_params(recruitment)
    html_string = recruitment.html
    doc = Nokogiri::HTML(html_string)

    {
      title: extract_title(doc),
      description: extract_description(doc),
      deadline: extract_deadline(doc),
      organization_name: extract_organization_name(doc),
      organization_email: extract_organization_email(doc),
      organization_phone_number: extract_organization_phone_number(doc),
      organization_hp: extract_organization_hp(doc),
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
    return nil if @deadline_selector.empty?

    html.css(@deadline_selector).text
  end

  # 団体名
  def extract_organization_name(html)
    return nil if @organization_name_selector.empty?

    html.css(@organization_name_selector).text
  end

  # メールアドレス
  def extract_organization_email(html)
    return nil if @organization_email_selector.empty?

    html.css(@organization_email_selector).text
  end

  # 電話番号
  def extract_organization_phone_number(html)
    return nil if @organization_phone_number_selector.empty?

    html.css(@organization_phone_number_selector).text.to_i
  end

  # ホームページ
  def extract_organization_hp(html)
    return nil if @organization_hp_selector.empty?

    html.css(@organization_hp_selector).text
  end
end
