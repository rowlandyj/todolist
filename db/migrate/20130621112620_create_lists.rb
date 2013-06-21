require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.timestamps
    end
  end
end
