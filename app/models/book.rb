class Book < ApplicationRecord

  belongs_to :user

  validates :book_name, presence: true
  validates :caption, presence: true, length: { in: 0..200 }

end
