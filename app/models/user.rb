class User < ApplicationRecord
  validates :email, presence: true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
  validates :firstname, presence: true
  validates :lastname, presence: true
end
