class UsersController < ApplicationController
  before_action :header_menu,only: [:index,:edit,:index]

  def index
  end

  def register_user_address
    @street_address = StreetAddress.new
  end

  def register_user_card
    street_info = StreetAddress.new(street_address_params)
    if street_info.save
      redirect_to new_cards_path
    else
      render :register_user_address
    end
  end


  private
  def street_address_params
    params.require(:street_address).permit(:bank, :bank_account, :branch_code, :account_number, :family_name, :first_name, :post_number, :city,:address, :building_name, :created_at, :updated_at, :prefecture_id ).merge(user_id: current_user.id)
  end

  def user_card_info_params
    params.require(:user).permit()
  end


end
