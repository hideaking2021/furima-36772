class OrderDelivery
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city, :address, :building, :phone, :user_id,  :item_id, :token


  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :area_id, numericality: { other_than: 1}
    validates :city
    validates :address
    validates :phone,format: { with: /\A[0-9]{11}\z/}
    validates :token
    validates :user_id
    validates :item_id
  end


  
  
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Delivery.create(postal_code: postal_code, area_id: area_id, city: city, address: address, building: building, phone: phone, order_id: order.id)
  end

end