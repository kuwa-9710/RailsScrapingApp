class CreateOrganizationScrapedRecruitments < ActiveRecord::Migration[7.0]
  def change
    create_table :organization_scraped_recruitments do |t|
      t.integer :organization_id
      t.integer :scraped_recruitment_id
      t.string :organization_name
      t.string :organization_email
      t.string :organization_phone_number
      t.string :organization_hp

      t.timestamps
    end
  end
end
