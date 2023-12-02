module RecruitmentCollector
  # 同じ募集団体を探す
  class SameOrganizationsFinder
    def initialize(scraped_recruitment)
      @scraped_recruitment = scraped_recruitment
    end

    def run
      organization_name = @scraped_recruitment.organization_name

      organization = OrganizationsScrapedRecruitment.find_by(name: organization_name)
      
    end
  end
end
