class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  

  def index
    @order_delivery = OrderDelivery.new
  end


  def create
    @order_delivery = OrderDelivery.new(delivery_params)
      if @order_delivery.valid?
        pay_item
        @order_delivery.save
        return redirect_to root_path
      else
        render :index
    end
  end

  private

  def delivery_params
    params.require(:order_delivery).permit(:postal_code, :area_id, :city, :address, :building, :phone).merge(token: params[:token],user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: delivery_params[:token],
      currency: 'jpy' 
    )
  end
  
end
