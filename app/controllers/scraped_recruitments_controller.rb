require_relative '../lib/recruitment_collector/crawl'

class ScrapedRecruitmentsController < ApplicationController
  def index
    RecruitmentCollector::Crawl.new.run
  end
end
