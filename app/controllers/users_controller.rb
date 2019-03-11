class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:add_card, :add_card_info, :pay, :delete_card]
  before_action :prepare_payjp, only: [:add_card, :add_card_info, :pay, :delete_card]

  def index
  end

  def test
  end

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

  private
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
