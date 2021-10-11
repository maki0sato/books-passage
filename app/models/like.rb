class Like < ApplicationRecord
  belongs_to :book, optional: true
  belongs_to :user, optional: true

  validates_uniqueness_of :book_id, scope: :user_id
end
