class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_one_attached :photo

  validates :title, :content, :url, presence: true
end
