10.times do
    Todo.create(title: Faker::Lorem.word,
        created_by: Faker::Lorem.word)
    end

5.times do
    Item.create(name: 'tolulope', todo_id: 6)
    Item.create(name: 'testimony', todo_id: 7)
    Item.create(name: 'juwon', todo_id: 8)
    Item.create(name: 'emmanuel', todo_id: 9)
    Item.create(name: 'olamide', todo_id: 10)
end