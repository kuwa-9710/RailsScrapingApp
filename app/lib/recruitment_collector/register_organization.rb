module RecruitmentCollector
  # 未登録の団体を登録する
  class RegisterOrganization
    def initialize
      @target_recruitments = ScrapedRecruitment.need_to_register
    end

    def run
      @target_recruitments.each do |recruitment|
        finder = SameOrganizationsFinder.new(recruitment) # 同じ団体を探す
        same_organization = finder.run

        next if same_organization # 同じ団体が見つかった場合はスキップ

        organization_data = OrganizationHandler.new(recruitment)
        formatted_organization_data = organization_data.format_data # フォーマットしてから保存
        OrganizationScrapedRecruitment.create(formatted_organization_data)
      end
    end
  end
end
