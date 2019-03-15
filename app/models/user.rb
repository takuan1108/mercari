class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :/validates :tellphone, presence: true
  validates :nickname, presence: true
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_phonetic, presence: true
  validates :first_name_phonetic, presence: true
  validates :birth_year, presence: true
  validates :birth_month, presence: true
  validates :birth_day, presence: true

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_one :street_address,dependent: :destroy
  has_one :credit_card,dependent: :destroy
  has_one :vendor, dependent: :destroy
  has_many :items
  has_many :item_comments, dependent: :destroy
  has_many :valuations
  has_many :deals
end
