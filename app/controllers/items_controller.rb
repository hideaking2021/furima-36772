class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end
  
  def edit
  end

  def create
    @item = Item.new(item_params)
      if @item.save
        redirect_to root_path
      else
        render :new
      end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :fee_id, :area_id, :shopping_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
