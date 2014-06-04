# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :job_session do
    job_id 1
    session_title "MyString"
    session_goals "MyString"
  end
end
