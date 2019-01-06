FactoryBot.define do
  factory :post do
    book_title {'テスト'}
    sentence1 {'RSpec & Capybara & FactoryBot を準備する'}
    user
  end
end
