# OrganizationScrapedRecruitmentsテーブルから、以下の二つを削除
# scraped_recruitment_id, organization_id
class RemoveScrapedRecruitmentIdFromOrganizationScrapedRecruitments < ActiveRecord::Migration[7.0]
  def change
    remove_column :organization_scraped_recruitments, :scraped_recruitment_id, :integer
    remove_column :organization_scraped_recruitments, :organization_id, :integer
  end
end
