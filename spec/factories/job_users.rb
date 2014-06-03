# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :job_user, :class => 'JobUsers' do
    job_id 1
    user_id 1
  end
end
