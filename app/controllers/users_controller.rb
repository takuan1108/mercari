class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:add_card, :add_card_info, :pay, :delete_card]
  before_action :prepare_payjp, only: [:add_card, :add_card_info, :pay, :delete_card]

  def index
  end


# -----------------ユーザー登録処理-----------------------
  def register_user_tel
    session[:user_info] = params[:user]
  end

  def register_user_address
    @vendor = Vendor.new

  end

  def register_user_card
    vendor = Vendor.create(vendor_params)
    render :register_user_address unless vendor
  end

  def register_user_complete
    # card = Credit_card.create(user_card_info_params)
    # render :register_user_address unless card
  end


# --------------クレジットカード追加処理--------------------
  def add_card
  end

  def add_card_info
    redirect_to action: :add_card if @card
  end

  def pay
    token = params[:token]
    @customer.cards.create(card: token) if @customer.cards.count == 0
    redirect_to action: :add_card, notice: "カードが登録されました。"
  end

  def delete_card
    @card.delete
    redirect_to action: :add_card, notice: "カード情報が削除されました。"
  end


# --------------プライベートメソッド--------------------
  private
  # def user_info_params
  #   params.permit(:email,:nickname, :family_name, :first_name, :family_name_phonetic, :first_name_phonetic, :birth_year, :birth_month, :birth_day)
  # end

  def vendor_params
    params.require(:vendor).permit(:bank, :bank_account, :branch_code, :account_number, :family_name, :first_name, :post_number, :city,:address, :building_name, :created_at, :updated_at, :prefecture_id ).merge(user_id: current_user.id)
  end

  def user_card_info_params
    params.require(:user).permit()
  end

  def prepare_payjp
    Payjp.api_key = ENV["PAYJP_SK_TEST"]
    unless current_user.payjp_id
      current_user.payjp_id = Payjp::Customer.create(description: 'test').id
      current_user.save
    end
    @customer = Payjp::Customer.retrieve(current_user.payjp_id)
    @card = @customer.cards.retrieve(@customer.default_card) if @customer.cards.count > 0
  end

end
