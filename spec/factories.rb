FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "person_#{n}@example.com"}
    password "foobar1234"
    password_confirmation "foobar1234"
  end

end