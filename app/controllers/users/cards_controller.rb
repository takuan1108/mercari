class Users::CardsController < ApplicationController
  include CardsActions
  before_action :authenticate_user!, only: [:show, :new, :create, :destroy]
  before_action :prepare_payjp, only: [:show, :new, :create, :destroy]
  before_action :header_menu,only: [:new,:show]

end
