class Post < ApplicationRecord
  has_many_attached :attachments
  has_one_attached :featured_image
  belongs_to :category, optional: true

  validates :title, presence: true

  # 표시할 메인 이미지를 반환하는 헬퍼 메서드
  def display_image
    if featured_image.attached?
      featured_image
    elsif attachments.attached?
      attachments.find { |attachment| attachment.image? }
    end
  end
end
