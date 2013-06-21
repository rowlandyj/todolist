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
    p "I am Listing a whole bunch of stuff"
  end

end
