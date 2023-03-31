class Product < ApplicationRecord
  belongs_to :category
  has_many :reviews
  acts_as_likeable

  # 一行当たりの表示件数
  PER = 15

  scope :display_list, -> (category, page) {
    if category != "none"
      where(category_id: category).page(page).per(PER)
    else
      page(page).per(PER)
    end
  }

  def reviews_new
    reviews.new
  end

  
end