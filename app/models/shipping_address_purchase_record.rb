class ShippingAddressPurchaseRecord
  include ActiveModel::Model
  attr_accessor :postal_code,:prefecture_id, :municipality, :address, :building_number, :tel, :purchase_record, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id
    validates :municipality
    validates :address
    validates :tel, format: {with: /\A\d{11}\z/}
  end
# binding.pry
  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_number: building_number, tel: tel, purchase_record_id: purchase_record.id)
  end
end