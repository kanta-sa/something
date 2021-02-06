FactoryBot.define do
  factory :user, class: User do
    email { 'test@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end