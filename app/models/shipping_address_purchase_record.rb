class ShippingAddressPurchaseRecord
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building_number, :tel, :purchase_record, :user_id,
                :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :municipality
    validates :address
    validates :tel, format: { with: /\A\d{10,11}\z/ }
    validates :token
    validates :user_id
    validates :item_id
    with_options numericality: { only_integer: true, greater_than_or_equal_to: 2 } do
      validates :prefecture_id
    end
  end

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address,
                           building_number: building_number, tel: tel, purchase_record_id: purchase_record.id)
  end
end
