module RecruitmentCollector
  # 団体を登録するためにデータを整形する
  class OrganizationHandler
    def initialize(recruitment)
      @data = recruitment
    end

    def format_data
      {
        organization_name: @data.organization_name,
        organization_email: @data.organization_email,
        organization_phone_number: @data.organization_phone_number,
        organization_hp: @data.organization_hp
      }
    end
  end
end
