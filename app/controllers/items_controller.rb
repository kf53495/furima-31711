class ItemsController < ApplicationController
  before_action :move_to_sign_in, only: [:new, :edit, :destroy]
  before_action :find_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order('items.created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to action: :index unless current_user.id == @item.user_id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
    end
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_explanation, :category_id, :status_id, :delivery_fee_payer_id, :prefecture_id, :delivery_time_id, :price).merge(user_id: current_user.id)
  end

  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
