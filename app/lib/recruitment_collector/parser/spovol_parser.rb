class RecruitmentCollector::Parser::SpovolParser < RecruitmentCollector::DefaultParser
  def initialize
    super

    @title_selector = '.mod_listItemTitle'
    @desc_selector = '.events_detailDetailTable tr:nth-child(2) td'
    @deadline_selector = '.events_detailDetailTable tr:nth-child(7) td'
    @organization_name_selector = '.events_detailHeaderSponsor p:nth-child(2) a'
    @organization_email_selector = ''
    @organization_phone_number_selector = ''
    @organization_hp_selector = '.events_detailHeaderSponsor tr:nth-child(9) a:nth-child(1)'
  end

  # 　　正規表現を使用して、締切を抽出
  def extract_deadline(html)
    th_element = html.at('th:contains("申込期間")')
    return unless th_element

    td_element = th_element.next_element
    td_text = td_element.text

    date_text = td_text.match(%r{(\d{4}/\d{2}/\d{2})})[1]
    Date.strptime(date_text, '%Y/%m/%d')
  end
end
