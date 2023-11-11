require_relative '../lib/recruitment_collector/crawl'

class ScrapedRecruitmentsController < ApplicationController
  def index
    CrawlAndParseJob.perform_later
    @scraped_recruitments = ScrapedRecruitment.all.order(created_at: :desc).limit(50)
  end
end
