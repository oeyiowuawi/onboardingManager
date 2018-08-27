
class DueTaskNotifier

  NOTIFIER_STRATEGY_MAPPINGS = { email: EmailNotifierStrategy }

  def initialize(strategy:, task:)
    @strategy = strategy
    @task = task
  end

  def notify
    strategy.notify(task)
  end

  def self.factory(strategy:, task:)
    strategy_klass = NOTIFIER_STRATEGY_MAPPINGS[strategy]
    new(task: task, strategy: strategy_klass.new)
  end

  private

  attr_reader :strategy, :task
end
