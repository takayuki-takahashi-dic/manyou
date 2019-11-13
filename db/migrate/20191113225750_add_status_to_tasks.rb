class AddStatusToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :status, :integer
    change_column_null :tasks, :status, false, 0
  end
end
