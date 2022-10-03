class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :prevent_url
  before_action :sold_edit


  def index
    @item = Item.find(params[:item_id])
    @purchase_order = PurchaseOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_order = PurchaseOrder.new(order_params)
    if @purchase_order.valid?
      pay_item
      @purchase_order.save
      return redirect_to root_path
    else
    render :index
    end
  end

  private

  def order_params
    item = Item.find(params[:item_id])
    params.require(:purchase_order).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end
  
  def prevent_url
    if current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def sold_edit
    if @item.purchase.present?
      redirect_to root_path
    end
  end
