class ScrapedRecruitment < ApplicationRecord
  def self.need_to_parse
    ScrapedRecruitment.where(last_parsed_at: nil)
  end
end
