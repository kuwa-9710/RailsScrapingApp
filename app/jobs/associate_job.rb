# 登録団体の紐付けを行う
class AssociateJob < ApplicationJob
  queue_as :default

  def perform
    RecruitmentCollector::Associate.new.run
  end
end
