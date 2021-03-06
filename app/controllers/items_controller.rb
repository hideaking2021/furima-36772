class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show
    
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

  def update     
        if @item.update(item_params)
          redirect_to action: "show"
        else
          render :edit
        end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :fee_id, :area_id, :shopping_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path if current_user.id != @item.user_id || @item.order
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
