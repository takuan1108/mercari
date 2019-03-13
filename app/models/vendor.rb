class Vendor < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :prefecture
  belongs_to :user
  has_many :items
  has_many :valuations
  has_many :deals

  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :post_number, numericality: { only_integer: true }
end
