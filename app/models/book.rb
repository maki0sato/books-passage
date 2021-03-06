class Book < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to        :user
  belongs_to        :genre
  has_one_attached  :image
  has_many          :comments
  has_many          :likes, dependent: :destroy
  has_many          :liked_users, through: :likes, source: :user, dependent: :destroy


  validates :title,          presence: true
  validates :author,         presence: true
  validates :genre_id,       presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :thoughts,       presence: true
  validates :sentence,       presence: true
  validates :synopsis,       presence: true
  validates :begining,       presence: true
  validates :user_id,        presence: true
  validates :image,          presence: true

  def self.search(search)
    if search != ""
      Book.where('title LIKE(?)', "%#{search}%").or(Book.where('author LIKE(?)', "%#{search}%"))
    else
      Book.all
    end
  end
end
