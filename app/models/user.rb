class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :lockable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :firstname, presence: true
  validates :lastname, presence: true
  # Add avatar
  has_one_attached :avatar
  
  # Posts
  has_many :posts, dependent: :destroy

end
