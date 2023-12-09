class OrganizationScrapedRecruitment < ApplicationRecord
  belongs_to :scraped_recruitment, class_name: 'ScrapedRecruitment'
end
