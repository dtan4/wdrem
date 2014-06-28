# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :word do
    sequence(:word) { |i| "word#{i}" }
    sequence(:meaning) { |i| "meaning#{i}" }

    factory :invalid_word do
      meaning nil
    end
  end
end
