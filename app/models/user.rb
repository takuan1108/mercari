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

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable

  has_one :street_address,dependent: :destroy
  has_one :credit_card,dependent: :destroy
  has_one :vendor, dependent: :destroy
  has_many :items
  has_many :item_comments, dependent: :destroy
  has_many :valuations
  has_many :deals
  has_many :social_profiles
  accepts_nested_attributes_for :social_profiles

  def self.find_for_oauth_about_user(auth)
    user = User.new( nickname: auth.info.name ,email: auth.info.email, password: Devise.friendly_token[0, 20] )
    return user
    # userにauth経由で引っ張ってきたfacebookの情報を持たせてnewしている
    # selfが省略されているので、クラスメソッドであることを意識してとらえるように
  end

end
