require "rails_helper"
require "rake"

describe "Send Notifications to admin for past due tasks" do
  before(:all) do
    load Rails.root.join("lib/tasks/past_due_task.rake")
    Rake::Task.define_task(:environment)
  end

  after(:all) do
    Rake.application.clear
  end

  it "sends notification" do
    admin_employee = create(:employee)
    create(:admin, employee: admin_employee, department: admin_employee.department)
    employee = create(:employee, department: admin_employee.department,
                                 email: "user@email.com")
    create(:task, employee: employee, created_by_id: admin_employee.id,
                  description: "This should have been completed", done: true,
                  due_date: Date.current - 1.day)
binding.pry
    rake_task = Rake::Task["onboardingManager:tasks:notify_admin_for_past_due_tasks"]

    expect do
      rake_task.invoke
    end.to output(/Notified admins for 1 past due task/).to_stdout
  end
end
