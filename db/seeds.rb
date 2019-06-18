10.times do
    Todo.create(title: Faker::Lorem.word,
        created_by: Faker::Lorem.word)
    end