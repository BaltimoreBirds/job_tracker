# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :jobs_user, :class => 'JobsUser' do
    job_id 1
    user_id 1
  end
end
