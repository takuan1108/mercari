class Items::DealsController < ApplicationController
  include CardsActions
  before_action :authenticate_user!, only: [:new, :create]
  before_action :prepare_payjp, only: [:new, :create]

  def new
    @item = Item.find(params[:item_id])
    @address = current_user.street_address
  end

  def create
  end

end
