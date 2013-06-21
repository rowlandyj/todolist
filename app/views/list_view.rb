module ListView

  def welcome_message
    puts "Welcome To List Manager\n"
  end

  def print_tasks
    puts "Id".ljust(5) + "Complete".ljust(10) + "Item".ljust(25)
    @tasks.each do |task|
      puts "#{task.id}.".ljust(5) + "#{task.complete}".ljust(10) +  "#{task.item}".ljust(25)
    end
  end

  def print_add_message
    puts "Added #{@task.item} to your List"
  end

  def print_delete_message
    puts "Deleted #{@deleted_item} from your List"
  end

  def print_complete_message
    puts "Marked #{@task.item} as complete"
  end
end
