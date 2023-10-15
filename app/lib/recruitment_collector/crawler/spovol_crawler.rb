require_relative '../default_crawler'

class RecruitmentCollector::Crawler::SpovolCrawler < RecruitmentCollector::DefaultCrawler
  def initialize
    super

    @home_url = 'https://spovol.net/'
    @site_url = 'https://spovol.net/events/?con=f&region=1&sdym=2023-10-10&keyword='
    @recruitment_css_selector = 'a.details'
    @recruitment_content = 'form'
  end
end
