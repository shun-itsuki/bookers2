class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books,dependent: :destroy
  attachment :user_image
  validates :name, presence: true, uniqueness: true

  with_options on: :update do |update|
    update.validates :introduction,    length: { in: 1..50 }
  end
end
