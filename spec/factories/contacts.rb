FactoryBot.define do
  factory :contact do
    name { "MyString" }
    email { "MyString" }
    content { "MyText" }
    remote_ip { "" }
  end
end
