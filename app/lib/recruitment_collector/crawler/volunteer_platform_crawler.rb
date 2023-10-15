require_relative '../default_crawler'

class RecruitmentCollector::Crawler::VolunteerPlatformCrawler < RecruitmentCollector::DefaultCrawler
  def initialize
    super

    @home_url = 'https://b.volunteer-platform.org'
    @site_url = 'https://b.volunteer-platform.org/portal/index/page~1'
    @recruitment_css_selector = '.new-post div.center a'
    @recruitment_content = '.contens_sub_inner'
  end
end
