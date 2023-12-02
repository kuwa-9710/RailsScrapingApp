class ScrapedRecruitment < ApplicationRecord
  # scope :need_to_parse, -> { where(last_parsed_at: nil) }
  scope :need_to_parse, -> { where(organization_id: nil) }

  scope :parsed_contents, -> { order(created_at: :desc).limit(50) }

  scope :need_to_associate, -> {}
end
