module RecruitmentCollector
  # 登録団体との紐付けを行う
  class Associate
    def initialize
      @target_recruitments = ScrapedRecruitment.need_to_associate
    end

    def run
      @target_recruitments.find_each do |recruitment|
        # 紐付けできる団体を探して、存在する場合は登録団体モデルのインスタンスを返す
        # organization = 登録団体の情報
        # recruitment = 求人の情報
        finder = SameOrganizationsFinder.new(recruitment)
        organization = finder.run
        next if organization.blank?

        # 紐付け情報を保存（既に過去紐付けを保存している場合はアップデート）
        organizations_scraped_recruitment = OrganizationScrapedRecruitment.find_or_initialize_by(scraped_recruitment_id: recruitment.id)
        organization_data = {
          organization_id: organization.id,
          organization_name: organization.organization_name,
          organization_email: organization.organization_email,
          organization_phone_number: organization.organization_phone_number,
          organization_hp: organization.organization_hp
        }

        organizations_scraped_recruitment.update(organization_data)

        need_to_update_recruitment_data = {
          last_confirmed_association_at: Time.zone.now,
          organization_id: organization.id
        }
        recruitment.update(need_to_update_recruitment_data)
      end
    end
  end
end
