class StreetAddressesController < ApplicationController
  def new
    @street_address = StreetAddress.new

  end
  def create
    street_address = StreetAddress.new(street_address_params)
    if street_address.save
      redirect_to users_path
    else
      render action: 'register_user_address', controller: 'users'
    end
  end

  def edit
    if current_user.street_address
      @street_address = StreetAddress.find_by(user_id: current_user.id )
    else
      @street_address = StreetAddress.new
    end
  end

  def update
    if StreetAddress.update(street_address_params)
      redirect_to users_path
    else
      render :edit
    end
  end
  private
  def street_address_params
    params.require(:street_address).permit(:post_number, :prefecture_id, :city, :address, :building_name, :family_name,:first_name, :first_name_phonetic, :family_name_phonetic).merge(user_id: current_user.id)
  end
end
