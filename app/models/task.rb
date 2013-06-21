class Task < ActiveRecord::Base
  belongs_to :list
  has_and_belongs_to_many :tags

  def mark_complete
    self[:complete] = "[X]"
    self[:completed_at] = DateTime.now
  end
end
