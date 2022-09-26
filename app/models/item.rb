class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_cost
  belongs_to :prefecture
  belongs_to :shipping_date
  
  validates :name, presence: true
  validates :discription, presence: true

  validates :image, presence: true

  with_options numericality: { other_than: 1 } do
    validates :category_id, :condition_id, :delivery_cost_id, :prefecture_id, :shipping_date_id
  end

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is invalid'}
  end
end
