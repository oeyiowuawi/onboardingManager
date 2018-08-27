namespace :onboardingManager do
  namespace :tasks do

    desc "Send Notification to Admins for tasks that are past due"
    task :notify_admin_for_past_due_tasks => :environment do
      due_tasks = Task.where("due_date < ?", Date.current).not_notified
      puts due_tasks.count
      due_tasks.each do |due_task|
        notifier = DueTaskNotifier.factory(due_task)
        notifier.notify
      end
      puts "Notified admins for #{due_tasks.count} past due task"
    end
  end
end
