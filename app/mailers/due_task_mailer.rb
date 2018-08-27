class DueTaskMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.due_task_mailer.notify.subject
  #
  def notify(task)
    @greeting = "Hi"
    @admin = task.admin
    @employee = task.employee
    @task = task

    mail to: @admin.email, from: "Notifications@onboardingManager.com", subject: "Notification of Due task" 
  end
end
