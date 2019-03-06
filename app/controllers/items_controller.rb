class ItemsController < ApplicationController

  def index
    @items_ladys = Item.includes(:category).where(categories:{large:"レディース"}).limit(4)
    @items_mens = Item.includes(:category).where(categories:{large:"メンズ"}).limit(4)
    @items_babys = Item.includes(:category).where(categories:{large:"ベビー・キッズ"}).limit(4)
    @items_cosmes = Item.includes(:category).where(categories:{large:"コスメ・香水・美容"}).limit(4)
  end

  def new
  end

  def show
  end

  def buy
  end

end
