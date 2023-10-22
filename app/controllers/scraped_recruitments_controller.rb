require_relative '../lib/recruitment_collector/crawl'

class ScrapedRecruitmentsController < ApplicationController
  def index
    RecruitmentCollector::Crawl.new.run
    RecruitmentCollector::Parse.new.run
    @scraped_recruitments = ScrapedRecruitment.all.order(created_at: :desc).limit(50)
  end
end
