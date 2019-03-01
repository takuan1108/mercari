class Prefecture < ApplicationRecord
  has_one :street_address
  has_one :item
  has_one :vendor
end
