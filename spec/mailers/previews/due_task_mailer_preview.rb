# Preview all emails at http://localhost:3000/rails/mailers/due_task_mailer
class DueTaskMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/due_task_mailer/notify
  def notify
    DueTaskMailerMailer.notify
  end

end
