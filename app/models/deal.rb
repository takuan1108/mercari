class Deal < ApplicationRecord
  belongs_to :user
  belongs_to :vendor
  belongs_to :item
end
