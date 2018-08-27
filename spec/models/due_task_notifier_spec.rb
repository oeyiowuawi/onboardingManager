require "rails_helper"

describe DueTaskNotifier do
  describe ".factory" do
    it "returns an instance of DueTaskNotifier" do
      task = create(:task)

      notifier = DueTaskNotifier.factory(task: task, strategy: :email)

      expect(notifier).to be_an_instance_of DueTaskNotifier
    end
  end

  describe "#notify" do
    it "calls notify on the strategy object" do
      task = create(:task)
      strategy = EmailNotifierStrategy.new
      allow(EmailNotifierStrategy).to receive(:new).and_return(strategy)
      allow(strategy).to receive(:notify)

      notifier = DueTaskNotifier.factory(task: task, strategy: :email)
      notifier.notify

      expect(strategy).to have_received(:notify)
    end
  end
end
