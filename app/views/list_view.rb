module ListView

  def welcome_message
    puts "Welcome To List Manager\n"
  end

  def print_tasks
    @tasks.each do |task|
      puts "Id: #{task.id} Item: #{task.item}"
    end
  end

  def print_add_message
    puts "Added #{@task.item} to your List"
  end

  def print_delete_message
    puts "Deleted #{@deleted_item} from your List"
  end
end
