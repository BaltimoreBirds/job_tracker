# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    github_uid "MyString"
    name "MyString"
    display_name "MyString"
  end
end
