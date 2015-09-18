Fabricator(:article) do
  comments(count: 2)
  title { Faker::Book.title }
  text { Faker::Lorem.paragraph }
end

Fabricator(:comment) do
  commenter { Faker::Name.name }
  body { Faker::Lorem.paragraph }
end

6.times do
  Fabricate(:article)
end
