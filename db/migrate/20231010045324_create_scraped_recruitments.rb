class CreateScrapedRecruitments < ActiveRecord::Migration[7.0]
  def change
    create_table :scraped_recruitments do |t|
      t.text :url
      t.text :html
      t.string :title
      t.integer :kind
      t.text :description
      t.date :deadline
      t.string :organization_name
      t.string :organization_email
      t.integer :organization_phone_number
      t.text :organization_hp
      t.datetime :last_crawled_at
      t.datetime :last_parsed_at
      t.datetime :last_confirmed_association_at

      t.timestamps
    end
  end
end
