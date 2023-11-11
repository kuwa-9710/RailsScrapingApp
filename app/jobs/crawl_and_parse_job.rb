class CrawlAndParseJob < ApplicationJob
  queue_as :default

  def perform
    RecruitmentCollector::Crawl.new.run
    RecruitmentCollector::Parse.new.run
  end
end
