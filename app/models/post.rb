class Post < ApplicationRecord
  validates :body, length: { in: 5..200 }
  validates :body, presence: true
end
