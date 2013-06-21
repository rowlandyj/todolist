class AddCompletenessToTasks < ActiveRecord::Migration
  def change
    add_column :tasks,:complete,:string, default: "[ ]"
  end
end
