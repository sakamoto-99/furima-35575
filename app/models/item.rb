class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :category
  belongs_to :status
  belongs_to :day_to_ship
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :user
  has_one    :purchase_record
  with_options presence: true do
    validates :image
    validates :title
    validates :description
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    with_options numericality: { only_integer: true, greater_than_or_equal_to: 2 } do
      validates :category_id
      validates :status_id
      validates :delivery_charge_id
      validates :prefecture_id
      validates :day_to_ship_id
    end
  end
end
