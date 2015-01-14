class User < ActiveRecord::Base
  has_many :tasks
  validates :email, uniqueness: true, presence: true
  has_secure_password
end
