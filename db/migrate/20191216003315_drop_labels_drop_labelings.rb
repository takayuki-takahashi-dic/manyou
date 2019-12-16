class DropLabelsDropLabelings < ActiveRecord::Migration[5.2]
  def change
    drop_table :labels
    drop_table :labelings
  end
end
