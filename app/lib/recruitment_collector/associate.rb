module RecruitmentCollector
  # 登録団体との紐付けを行う
  class Associate
    def initialize
      @target_recruitments = ScrapedRecruitment.need_to_associate
    end

    def run
      @target_recruitments.find_each do |recruitment|
        # 処理を記述
        finder = SameOrganizationsFinder.new(recruitment)
        organization = finder.run
      end
    end
  end
end
