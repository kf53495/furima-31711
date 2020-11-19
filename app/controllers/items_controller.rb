class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :item_explanation, :category_id, :status_id, :delivery_fee_payer_id, :prefecture_id, :delivery_time_id, :price).merge(user_id: current_user.id)
  end



end
