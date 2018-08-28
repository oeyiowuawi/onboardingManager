namespace :onboardingManager do
  namespace :tasks do

    desc "Send Notification to Admins for tasks that are past due"
    task :notify_admin_for_past_due_tasks => :environment do
      due_tasks = Task.where("due_date < ?", Date.current).not_notified
      number_of_tasks = due_tasks.count
      due_tasks.each do |due_task|
        notifier = DueTaskNotifier.factory(task: due_task, strategy: :email)
        notifier.notify
      end
      puts "Notified admins for #{number_of_tasks} past due task"
    end
  end
end
