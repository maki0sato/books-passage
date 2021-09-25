class Book < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :genre
  has_one_attached :image


  validates :title,          presence: true
  validates :author,         presence: true
  validates :genre_id,       presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :impression,     presence: true
  validates :sentence,       presence: true
  validates :synopsis,       presence: true
  validates :begining,       presence: true
  validates :user_id,        presence: true
  validates :image,          presence: true
end