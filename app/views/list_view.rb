module ListView

  def welcome_message
    puts "Welcome To List Manager\n"
  end

  def print_tasks
    return if @tasks.empty?
    puts "List: #{@tasks.first.list.name}"
    puts "Id".ljust(5) + "Complete".ljust(10) + "Item".ljust(25)
    @tasks.each do |task|
      puts "#{task.id}.".ljust(5) + "#{task.complete}".ljust(10) +  "#{task.item}".ljust(25)
    end
  end

  def print_add_message
    puts "Added #{@task.item} to #{@task.list.name}"
  end

  def print_delete_message
    puts "Deleted #{@deleted_item} from #{@list.name}"
  end

  def print_complete_message
    puts "Marked #{@task.item} as complete from #{@task.list.name}"
  end

  def print_lists
    puts "Id".ljust(5) + "Name".ljust(25)
    @lists.each do |list|
      puts "#{list.id}.".ljust(5) +  "#{list.name}".ljust(25)
    end
  end

  def print_add_list_message
    puts "Created new list called #{@list.name}"
  end

  def print_delete_list_message
    puts "Delete list #{@list.name}"
  end
end
