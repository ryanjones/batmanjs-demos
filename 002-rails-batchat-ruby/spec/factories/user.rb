FactoryGirl.define do
  factory :user do |f|
    f.name "Fake"
    f.logged_in true
  end

  factory :invalid_user, :parent => :user do |f|
    f.name nil
  end
end