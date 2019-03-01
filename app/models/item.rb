class Item < ApplicationRecord
  belongs_to :user
  belongs_to :vendor
  belongs_to :prefecture
  belongs_to :barnd
  belongs_to :size
  belongs_to :category
  has_many :item_images,dependent: :destroy
  has_many :item_comments,dependent: :destroy
  has_one :deal
end
