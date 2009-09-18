class Login < ActiveRecord::Base
  validates_presence_of :username, :password
end
