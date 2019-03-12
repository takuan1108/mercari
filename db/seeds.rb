require "csv"
#csvファイルを扱うためのgemを読み込む


# ===========以下はサンプル=============
# CSV.foreach('db/hoge.csv') do |row|
# #foreachは、ファイル（hoge.csv）の各行を引数として、ブロック(do~endまでを範囲とする『引数のかたまり』)を繰り返し実行する
# #rowには、読み込まれた行が代入される

# User.create(:name => row[0], :zipcode => row[1], :address => row[2])
# #usersテーブルの各カラムに、各行のn番目の値を代入している。

# end
# ===================================

Valuation.all.delete_all
Deal.all.delete_all
StreetAddress.all.delete_all
ItemComment.all.delete_all
ItemImage.all.delete_all
Item.all.delete_all
Vendor.all.delete_all
User.all.delete_all
Category.delete_all
Brand.destroy_all

puts "ブランドテーブルを入力中・・・"
CSV.foreach('db/csv/brands.csv') do |row|
  Brand.create(
    name:row[1],
    created_at:row[2],
    updated_at:row[3],
    pick_up:row[4]
  )
end

puts "カテゴリーテーブルを入力中・・・"
CSV.foreach('db/csv/categories.csv') do |row|
  Category.create(
    name:row[1],
    middle:row[2],
    small:row[3],
    created_at:row[4],
    updated_at:row[5],
    pick_up:row[6]
  )
end


puts "ユーザーテーブルを入力中・・・"
User.create(
    # id:1,
    nickname:"ゴジラ",
    tellphone:55555555555,
    family_name:"松井",
    first_name:"秀喜",
    family_name_phonetic:"マツイ",
    first_name_phonetic:"ヒデキ",
    birth_year:1974,
    birth_month:6,
    birth_day:12,
    icon:nil,
    profile:nil,
    invitation_code:nil,
    email:"aaa@aaa",
    password:"passw0rd",
    reset_password_token:nil,
    reset_password_sent_at:nil,
    remember_created_at:nil,
    created_at:201811110000,
    updated_at:201811110000
  )
User.create(
    # id:2,
    nickname:"イチロー",
    tellphone:51515151515,
    family_name:"鈴木",
    first_name:"一朗",
    family_name_phonetic:"スズキ",
    first_name_phonetic:"イチロー",
    birth_year:1973,
    birth_month:10,
    birth_day:22,
    icon:nil,
    profile:nil,
    invitation_code:nil,
    email:"bbb@bbb",
    password:"passw0rd",
    reset_password_token:nil,
    reset_password_sent_at:nil,
    remember_created_at:nil,
    created_at:201811110000,
    updated_at:201811110000
  )
#====ここのCSVの読み込み、うまく言っていないのでベタ打ち=====
# User.all.delete_all
# CSV.foreach('db/csv/users.csv') do |row|
#   User.create(
#     nickname:row[1],
#     tellphone:row[2],
#     family_name:row[3],
#     first_name:row[4],
#     family_name_phonetic:row[5],
#     first_name_phonetic:row[6],
#     birth_year:row[7],
#     birth_month:row[8],
#     birth_day:row[9],
#     icon:row[10],
#     profile:row[11],
#     invitation_code:row[12],
#     email:row[13],
#     reset_password_token:row[15],
#    reset_password_sent_at:row[16],
#   remember_created_at:row[17],
#  created_at:row[18],
# updated_at:row[19]
#)
# end
### =============================


puts "ベンダーテーブルを入力中・・・"
CSV.foreach('db/csv/vendors.csv') do |row|
  vendor = Vendor.create(
    id:row[0],
    user_id:row[1],
    bank:row[2],
    bank_account:row[3],
    branch_code:row[4],
    account_number:row[5],
    family_name:row[6],
    first_name:row[7],
    post_number:row[8],
    prefecture_id:row[9],
    city:row[10],
    address:row[11],
    building_name:row[12],
    created_at:row[13],
    updated_at:row[14]
  )
end

puts "アイテムテーブルを入力中・・・"
CSV.foreach('db/csv/items.csv',external_encoding: "Shift_JIS",
    internal_encoding: "utf-8") do |row|
  item =Item.create(
    id:row[0],
    name:row[1],
    description:row[2],
    price:row[3],
    condition:row[4],
    shipping_method:row[5],
    shipping_date:row[6],
    shipping_fee:row[7],
    prefecture_id:row[8],
    brand:row[9],
    size_id:row[10],
    category_id:row[11],
    user_id:2,#nullの書き方不明のため直打ち
    vendor_id:row[13],
    created_at:row[14],
    updated_at:row[15]
  )
end

puts "アイテムイメージテーブルを入力中・・・"
CSV.foreach('db/csv/item_images.csv') do |row|
  p =ItemImage.create(
    id:row[0],
    image:row[1],
    item_id:row[2],
    created_at:row[3],
    updated_at:row[4]
  )
end


puts "アイテムコメントテーブルを入力中・・・"
CSV.foreach('db/csv/item_comments.csv',external_encoding: "Shift_JIS",internal_encoding: "utf-8") do |row|
  item=ItemComment.create(
    id:row[0],
    comment:row[1],
    user_id:row[2],
    item_id:row[3],
    created_at:row[4],
    updated_at:row[5]
  )
end


puts "ストリートアドレステーブルを入力中・・・"
CSV.foreach('db/csv/street_addresses.csv') do |row|
  StreetAddress.create(
    id:row[0],
    post_number:row[1],
    prefecture_id:row[2],
    city:row[3],
    address:row[4],
    building_name:row[5],
    user_id:row[6],
    created_at:row[7],
    updated_at:row[8]
  )
end


puts "ディールズテーブルを入力中・・・"
CSV.foreach('db/csv/deals.csv',external_encoding: "Shift_JIS",internal_encoding: "utf-8") do |row|
  Deal.create(
    id:row[0],
    string:row[1],
    user_id:row[2],
    item_id:row[3],
    vendor_id:row[4],
    created_at:row[5],
    updated_at:row[6]
  )
end


puts "バリュエーションテーブルを入力中・・・"
CSV.foreach('db/csv/valuations.csv') do |row|
  Valuation.create(
    id:row[0],
    satisfaction_level:row[1],
    comment:row[2],
    user_id:row[3],
    vendor_id:row[4],
    created_at:row[5],
    updated_at:row[6]
  )
end

