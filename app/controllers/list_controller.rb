class ListController

  include ListView

  def run
    command, arguments = self.parse

    command = command.gsub(/list:/,"list_")
    if command.include? "filter"
      p arguments = command[7..-1]
      p command = 'filter'
    end
    self.send(command,arguments)
  end

  def parse
    return ARGV[0], ARGV[1..-1]
  end

  def list(arguments)
    @tasks = List.find(arguments.first.to_i).tasks
    print_tasks
  end

  def add(arguments)
    @task = Task.create(list_id: arguments.first.to_i, item: arguments[1..-1].join(' '))
    print_add_message
  end

  def delete(arguments)
    @list = List.find(arguments.first.to_i)
    @task = @list.tasks.find(arguments[1].to_i)
    @deleted_item = @task.item
    @task.delete
    print_delete_message
  end

  def complete(arguments)
    @list = List.find(arguments.first.to_i)
    @task = @list.tasks.find(arguments[1].to_i)
    @task.mark_complete
    @task.save
    print_complete_message
  end

  def list_completed(arguments)
    @tasks = List.find(arguments.first.to_i).tasks.where(complete: "[X]").order(:completed_at)
    print_tasks
  end

  def list_outstanding(arguments)
    @tasks = List.find(arguments.first.to_i).tasks.where(complete: "[ ]").order(:created_at)
    print_tasks
  end

  #Tag Operations
  def tag(arguments)
    @task = Task.find(arguments[0].to_i)
    arguments[1..-1].each do |tag_string|
      @task.tags << Tag.find_or_create_by_tag(tag: tag_string)
    end
  end

  def filter(filter_string)
    @tasks = []
    Task.all.each do |task|
      @tasks << task if task.tags.where(tag: filter_string).exists?
    end
    print_tasks
  end

# List Operations

  def all_lists(arguments)
    @lists = List.all
    print_lists
  end

  def add_list(arguments)
    @list = List.create(name: arguments.join(' '))
    print_add_list_message
  end

  def delete_list(arguments)
    @list = List.find(arguments.first.to_i)
    @deleted_name = @list.name
    @list.delete
    print_delete_list_message
  end


end
