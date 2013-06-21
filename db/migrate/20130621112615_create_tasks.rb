require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :item
      t.timestamps
    end
  end
end
