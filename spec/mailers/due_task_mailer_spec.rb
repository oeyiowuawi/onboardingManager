require "rails_helper"

RSpec.describe DueTaskMailer, type: :mailer do
  describe "notify" do
 
    it "renders the headers" do
      admin = create(:employee, email: "test@mailer.com")
      task = create(:task, admin: admin)
      mail = DueTaskMailer.notify(task)

      expect(mail.subject).to eq("Notification of Due task")
      expect(mail.to).to eq([admin.email])
      expect(mail.from).to eq(["Notifications@onboardingManager.com"])
    end

    it "renders the body" do
      admin = create(:employee, email: "test@mailer.com", name: "Admin")
      task = create(:task, admin: admin)
      mail = DueTaskMailer.notify(task)

      expect(mail.body.encoded).to match(/Admin/)
    end
  end

end
