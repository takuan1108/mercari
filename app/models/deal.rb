class Deal < ApplicationRecord
  belongs_to :user
  belongs_to :item

  enum  status: {purchasable: 0, purchased: 1, paid: 2, sent: 3, arrived: 4}

  validates :status, presence: true
  validates :user_id, presence: true
  validates :item_id, presence: true
end
