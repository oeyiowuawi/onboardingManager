FactoryBot.define do
  factory :employee do
    name "MyString"
    email "employee@andela.com"
    start_date Date.current
    password "abc1234567"
  end
end
