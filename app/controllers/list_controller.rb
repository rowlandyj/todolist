class ListController

  include ListView

  def run
    command, arguments = self.parse
    self.send(command,arguments)
  end

  def parse
    return ARGV[0], ARGV[1..-1].join(' ')
  end

  def list(arguments)
    @tasks = Task.all
    print_tasks
  end

  def add(arguments)
    @task = Task.create(item: arguments)
    print_add_message
  end

  def delete(arguments)
    @task = Task.find(arguments.to_i)
    @deleted_item = @task.item
    @task.delete
    print_delete_message
  end

  def complete(arguments)
    @task = Task.find(arguments.to_i)
    @task.mark_complete
    @task.save
    print_complete_message
  end

end
