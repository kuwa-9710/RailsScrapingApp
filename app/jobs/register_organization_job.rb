# 未登録の団体を登録するJob
class RegisterOrganizationJob < ApplicationJob
  queue_as :default

  def perform
    RecruitmentCollector::RegisterOrganization.new.run
    puts '登録作業が完了しました。'
  rescue StandardError => e
    puts "Error in RegisterOrganizationJob: #{e.message}"
    puts e.backtrace.join("\n")
  end
end
