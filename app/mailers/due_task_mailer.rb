class DueTaskMailer < ApplicationMailer

  def notify(task)
    @greeting = "Hi"
    @admin = task.admin
    @employee = task.employee
    @task = task

    mail(
      to: @admin.email,
      from: "Notifications@onboardingManager.com",
      subject: "Notification of Due task"
    )
  end
end
