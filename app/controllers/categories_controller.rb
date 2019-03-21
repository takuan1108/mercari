class CategoriesController < ApplicationController
  before_action :header_menu,only: [:index,:show]

  def index
    @l_categories = Category.roots
  end

  def show
  end
end
