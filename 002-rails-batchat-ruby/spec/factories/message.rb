FactoryGirl.define do
  factory :message do
    content "blah"
  end

  factory :invalid_message, :parent => :message  do |f|
    content nil
  end
end