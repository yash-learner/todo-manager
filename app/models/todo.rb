class Todo < ActiveRecord::Base
  belongs_to :user
  def to_pleasent__string
    is_completed = completed ? "[x]" : "[ ]"
    "#{id}. #{due_date.to_s(:long)} #{todo_text} #{is_completed}"
  end
  # def self.of_user(user)
  #   where(user_id: user.id)
  # end
  def self.overdue
    where("due_date < ? and (not completed)", Date.today).order(:due_date)
  end

  def self.due_today
    where("due_date = ?", Date.today)
  end

  def self.due_later
    where("due_date > ?", Date.today).order(:due_date)
  end

  def self.add_task(todo)
    Todo.create!(todo_text: todo[:todo_text], due_date: Date.today + todo[:due_in_days], completed: false)
  end

  def self.completed
    where(completed: true)
  end

  def self.mark_as_complete(id)
    todo = Todo.find(id)
    todo.completed = true
    todo.save
    todo
  end
end
