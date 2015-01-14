class Task < ActiveRecord::Base
  validates :description, presence: true
  before_create :not_done
  belongs_to :user

  def not_done
    completed ||= false
  end
end
