# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :job do
    title "MyString"
    description "My goals, your goals"
    github_repo "http://foo.com"
  end
end
