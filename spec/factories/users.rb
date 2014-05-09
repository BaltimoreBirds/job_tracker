# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    github_uid "4583382"
    name "Michael Swain"
    display_name "BmoreBirds"
    email "mikey@msn.com"
  end
end
