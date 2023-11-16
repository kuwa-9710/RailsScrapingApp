# 型の変更と、カラムの追加
class ChangeOrganizationPhoneNumberAndAddOrganizationIdToScrapedRecruitments < ActiveRecord::Migration[7.0]
  def change
    change_column :scraped_recruitments, :organization_phone_number, :text
    add_column :scraped_recruitments, :organization_id, :integer
  end
end
