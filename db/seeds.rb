# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
region1 = Region.find_or_create_by(id: 1, name: '北海道')
region2 = Region.find_or_create_by(id: 2, name: '東北')
region3 = Region.find_or_create_by(id: 3, name: '関東')
region4 = Region.find_or_create_by(id: 4, name: '中部')
region5 = Region.find_or_create_by(id: 5, name: '近畿')
region6 = Region.find_or_create_by(id: 6, name: '中国')
region7 = Region.find_or_create_by(id: 7, name: '四国')
region8 = Region.find_or_create_by(id: 8, name: '九州')

Prefecture.find_or_create_by(code: 1, name: '北海道', region: region1)
Prefecture.find_or_create_by(code: 2, name: '青森県', region: region2)
Prefecture.find_or_create_by(code: 3, name: '岩手県', region: region2)
Prefecture.find_or_create_by(code: 4, name: '宮城県', region: region2)
Prefecture.find_or_create_by(code: 5, name: '秋田県', region: region2)
Prefecture.find_or_create_by(code: 6, name: '山形県', region: region2)
Prefecture.find_or_create_by(code: 7, name: '福島県', region: region2)
Prefecture.find_or_create_by(code: 8, name: '茨城県', region: region3)
Prefecture.find_or_create_by(code: 9, name: '栃木県', region: region3)
Prefecture.find_or_create_by(code: 10, name: '群馬県', region: region3)
Prefecture.find_or_create_by(code: 11, name: '埼玉県', region: region3)
Prefecture.find_or_create_by(code: 12, name: '千葉県', region: region3)
prefecture1 = Prefecture.find_or_create_by(code: 13, name: '東京都', region: region3)
prefecture2 = Prefecture.find_or_create_by(code: 14, name: '神奈川県', region: region3)
prefecture3 = Prefecture.find_or_create_by(code: 15, name: '新潟県', region: region4)
Prefecture.find_or_create_by(code: 16, name: '富山県', region: region4)
Prefecture.find_or_create_by(code: 17, name: '石川県', region: region4)
Prefecture.find_or_create_by(code: 18, name: '福井県', region: region4)
Prefecture.find_or_create_by(code: 19, name: '山梨県', region: region4)
Prefecture.find_or_create_by(code: 20, name: '長野県', region: region4)
Prefecture.find_or_create_by(code: 21, name: '岐阜県', region: region4)
Prefecture.find_or_create_by(code: 22, name: '静岡県', region: region4)
Prefecture.find_or_create_by(code: 23, name: '愛知県', region: region4)
Prefecture.find_or_create_by(code: 24, name: '三重県', region: region4)
Prefecture.find_or_create_by(code: 25, name: '滋賀県', region: region5)
Prefecture.find_or_create_by(code: 26, name: '京都府', region: region5)
Prefecture.find_or_create_by(code: 27, name: '大阪府', region: region5)
Prefecture.find_or_create_by(code: 28, name: '兵庫県', region: region5)
Prefecture.find_or_create_by(code: 29, name: '奈良県', region: region5)
Prefecture.find_or_create_by(code: 30, name: '和歌山県', region: region5)
Prefecture.find_or_create_by(code: 31, name: '鳥取県', region: region6)
Prefecture.find_or_create_by(code: 32, name: '島根県', region: region6)
Prefecture.find_or_create_by(code: 33, name: '岡山県', region: region6)
Prefecture.find_or_create_by(code: 34, name: '広島県', region: region6)
Prefecture.find_or_create_by(code: 35, name: '山口県', region: region6)
Prefecture.find_or_create_by(code: 36, name: '徳島県', region: region7)
Prefecture.find_or_create_by(code: 37, name: '香川県', region: region7)
Prefecture.find_or_create_by(code: 38, name: '愛媛県', region: region7)
Prefecture.find_or_create_by(code: 39, name: '高知県', region: region7)
Prefecture.find_or_create_by(code: 40, name: '福岡県', region: region8)
Prefecture.find_or_create_by(code: 41, name: '佐賀県', region: region8)
Prefecture.find_or_create_by(code: 42, name: '長崎県', region: region8)
Prefecture.find_or_create_by(code: 43, name: '熊本県', region: region8)
Prefecture.find_or_create_by(code: 44, name: '大分県', region: region8)
Prefecture.find_or_create_by(code: 45, name: '宮崎県', region: region8)
Prefecture.find_or_create_by(code: 46, name: '鹿児島県', region: region8)
Prefecture.find_or_create_by(code: 47, name: '沖縄県', region: region8)

if Rails.env.development?
  OffRoadTrack.find_or_create_by(name: 'テストモトクロスコース１', prefecture: prefecture1)
  OffRoadTrack.find_or_create_by(name: 'テストモトクロスコース２', prefecture: prefecture2)
  OffRoadTrack.find_or_create_by(name: 'テストモトクロスコース３', prefecture: prefecture3)
end

brand_beta = Brand.find_or_create_by(name: 'Beta')
brand_gas_gas = Brand.find_or_create_by(name: 'Gas Gas')
brand_honda = Brand.find_or_create_by(name: 'Honda')
brand_husaberg = Brand.find_or_create_by(name: 'Husaberg')
brand_husq = Brand.find_or_create_by(name: 'Husqvarna')
brand_ktm = Brand.find_or_create_by(name: 'KTM')
brand_kawasaki = Brand.find_or_create_by(name: 'Kawasaki')
brand_sherco = Brand.find_or_create_by(name: 'Sherco')
brand_suzuki = Brand.find_or_create_by(name: 'Suzuki')
brand_tm = Brand.find_or_create_by(name: 'TM')
brand_yamaha = Brand.find_or_create_by(name: 'Yamaha')

if Rails.env.development?
  model_crf = Model.find_or_create_by(brand: brand_honda, name: 'CRF 250R')
  Vehicle.find_or_create_by(model: model_crf, year: 2022)
  Vehicle.find_or_create_by(model: model_crf, year: 2021)
  Vehicle.find_or_create_by(model: model_crf, year: 2020)
  model_kxf = Model.find_or_create_by(brand: brand_kawasaki, name: 'KX 250F')
  model_kx = Model.find_or_create_by(brand: brand_kawasaki, name: 'KX 250')
  Vehicle.find_or_create_by(model: model_kxf, year: 2020)
  Vehicle.find_or_create_by(model: model_kx, year: 2020)
  Vehicle.find_or_create_by(model: model_kx, year: 2022)

  MaintenanceMenu.find_or_create_by(name: 'オイル交換')
  MaintenanceMenu.find_or_create_by(name: 'オイルフィルター')
  MaintenanceMenu.find_or_create_by(name: 'フロントフォーク')
  MaintenanceMenu.find_or_create_by(name: 'フロントタイヤ交換')
  MaintenanceMenu.find_or_create_by(name: 'ピストン')
end

Role.find_or_create_by(name: 'registered')
Role.find_or_create_by(name: 'administrator')
