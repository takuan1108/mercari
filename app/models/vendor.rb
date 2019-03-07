class Vendor < ApplicationRecord
  belongs_to :user
  # belongs_to_active_hash :prefecture
  has_many :items
  has_many :valuations
  has_many :deals
end
