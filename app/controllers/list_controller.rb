class ListController

  include ListView

  def run
    welcome_message
    command, arguments = self.parse
    self.send(command,arguments)
  end

  def parse
    return ARGV[0], ARGV[1..-1]
  end

  def list(arguments)
    @tasks = Task.all
    print_tasks
  end

  def add(arguments)
    @task = Task.create(item: arguments.to_s)
    print_add_message
  end

  def delete(arguments)
    @task = Task.find(arguments.to_i)
    @deleted_item = @task.item
    @task.delete
    print_delete_message
  end

end
