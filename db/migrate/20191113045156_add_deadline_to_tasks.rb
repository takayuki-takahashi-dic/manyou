class AddDeadlineToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :deadline, :date
    change_column_null :tasks, :deadline, false, "20191231"
  end
end
