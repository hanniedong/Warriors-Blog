class User < ApplicationRecord
  has_secure_password
  validates :first_name, :last_name, :username, :email, {presence: true}
  validates :email, {uniqueness: true}
end
