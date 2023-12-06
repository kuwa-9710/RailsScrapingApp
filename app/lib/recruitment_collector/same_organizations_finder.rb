module RecruitmentCollector
  # 同じ募集団体を探す
  class SameOrganizationsFinder
    def initialize(scraped_recruitment)
      @scraped_recruitment = scraped_recruitment
    end

    def run
      organization_name = @scraped_recruitment.organization_name
      organization_email = @scraped_recruitment.organization_email
      organization_phone_number = @scraped_recruitment.organization_phone_number
      organization_hp = @scraped_recruitment.organization_hp

      OrganizationScrapedRecruitment.find_by(
        'organization_name = ? OR organization_email = ? OR organization_phone_number = ? OR organization_hp = ?',
        organization_name, organization_email, organization_phone_number, organization_hp
      )
    end
  end
end
