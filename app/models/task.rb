class Task < ActiveRecord::Base
  belongs_to :list

  def mark_complete
    self[:complete] = "[X]"
  end
end
