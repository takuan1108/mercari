class Item < ApplicationRecord
  belongs_to :user
  belongs_to :vendor
  # belongs_to_active_hash :prefecture
  belongs_to :barnd
  belongs_to :size
  belongs_to :category
  has_many :item_images,dependent: :destroy
  has_many :item_comments,dependent: :destroy
  has_one :deal

  CONDITION = ["新品、未使用","未使用に近い","目立った傷や汚れなし","やや傷や汚れあり","傷や汚れあり","全体的に状態が悪い"]
  SHIPPING_FEE = ["送料込み（出品者負担）","着払い（購入者負担）"]
  SHIPPING_METHOD = ["未定","らくらくメルカリ便","ゆうメール","レターパック","普通郵便（定形、定形外）","クロネコヤマト","ゆうパック","クリックポスト","ゆうパケット"]
  SHIPPING_DATE = ["1~2日で発送","2~3日で発送","4~7日で発送"]
end
