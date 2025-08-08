class Post < ApplicationRecord
  has_many_attached :attachments

  validates :title, presence: true
end
