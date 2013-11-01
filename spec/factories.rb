FactoryGirl.define do
  factory :user do
    name     "Michael Hartl"
    email    "michaelh@example.com"
    password "password"
    password_confirmation "password"
  end

  factory :wod do
    name        "murph"
    rounds      "3"
    description "A hard ass workout named after a marine"
  end

  factory :completion do
    milliseconds 555_555
  end
end