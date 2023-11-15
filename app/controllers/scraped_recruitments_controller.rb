class ScrapedRecruitmentsController < ApplicationController
  def index
    @scraped_recruitments = ScrapedRecruitment.parsed_contents
  end
end
