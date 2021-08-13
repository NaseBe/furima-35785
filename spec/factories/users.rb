FactoryBot.define do
  factory :user do
    nickname              {'user123'}
    email                 {'user123@gmail.com'}
    password              {'user456'}
    password_confirmation {password}
    surname_kanji         {'田中'}
    name_kanji            {'太郎'}
    surname_kana          {'タナカ'}
    name_kana             {'タロウ'}
    birthday              {'1950-10-10'}
  end
end