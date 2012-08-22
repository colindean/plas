# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :waiver do
    title "MyString"
    body "MyText"
    event nil
  end
end
