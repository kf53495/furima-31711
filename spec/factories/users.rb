FactoryBot.define do
  factory :user do
    Faker::Config.locale = :ja
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {"1a#{password}"}
    #Fakerで自動生成すると稀に数字が含まれないことがあるので事前に数字と英字を含めている
    password_confirmation = password
    last_name {Faker::Name.last_name}
    first_name {Faker::Name.first_name}
    last_name_kana {Gimei.new.last.katakana}
    first_name_kana {Gimei.new.first.katakana}
    birth_date { Faker::Date.backward }
  end
end