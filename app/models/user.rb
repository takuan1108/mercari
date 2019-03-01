class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :street_address,dependent: :destroy
  has_one :credit_card,dependent: :destroy
  has_one :vendor, dependent: :destroy
  has_many :items
  has_many :item_comments, dependent: :destroy
  has_many :valuations
  has_many :deals
end
