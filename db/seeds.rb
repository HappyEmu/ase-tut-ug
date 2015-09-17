Fabricator(:article) do
  title { Faker::Book.title }
  text { Faker::Lorem.paragraph }
end

10.times do
  Fabricate(:article)
end
