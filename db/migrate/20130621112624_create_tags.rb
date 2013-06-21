class CreateTags < ActiveRecord::Migration
  def change
    
    create_table :tags do |t|
      t.string :tag
      t.timestamps
    end

    create_table :tags_tasks, id: false do |t|
      t.references :task
      t.references :tag
    end

  end
end
