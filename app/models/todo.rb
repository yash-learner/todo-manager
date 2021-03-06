class Todo < ActiveRecord::Base
  validates :todo_text, presence: true
  validates :todo_text, length: { minimum: 2 }
  validates :due_date, presence: true

  belongs_to :user

  def to_pleasent_string
    is_completed = completed ? "[x]" : "[ ]"
    "#{id}. #{due_date.to_s(:long)} #{todo_text} #{is_completed}"
  end

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
    Todo.create!(
      todo_text: todo[:todo_text],
      due_date: Date.today + todo[:due_in_days],
      completed: false,
    )
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
