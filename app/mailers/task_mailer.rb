class TaskMailer < ActionMailer::Base
  default from: "reminders@opencamp.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.task_mailer.task_creation.subject
  #
  def task_creation(task)
    @task = task
    @project = @task.project
    mail to: task.user.email, subject: "New task created: #{task.name}"
  end
end
