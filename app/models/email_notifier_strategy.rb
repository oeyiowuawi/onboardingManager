class EmailNotifierStrategy

  def notify(task)
    DueTaskMailer.notify(task).deliver_later
  end
end
