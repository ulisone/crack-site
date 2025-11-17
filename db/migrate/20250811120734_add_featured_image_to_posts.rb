class AddFeaturedImageToPosts < ActiveRecord::Migration[8.0]
  def change
    # Active Storage를 사용하므로 별도 컬럼 추가 불필요
    # Post 모델에 has_one_attached :featured_image만 추가하면 됨
  end
end
