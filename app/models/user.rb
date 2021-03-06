class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  has_many   :books
  has_many   :comments
  has_many   :likes, dependent: :destroy
  has_many   :liked_books, through: :likes, source: :book

  has_many   :relationships
  has_many   :followings, through: :relationships, source: :follow
  has_many   :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many   :followers, through: :reverse_of_relationships, source: :user
  
  validates :nickname,        presence: true
  validates :genre_id,        presence: true

  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end

  def already_liked?(book)
    self.likes.exists?(book_id: book.id)
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.nickname = "ゲスト"
      user.genre_id = "1"
    end
  end
end