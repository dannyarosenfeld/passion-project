20.times do (
   User.create(
     username: Faker::Internet.user_name,
     image: Faker::Avatar.image,
     password: "123"
     )
   )
 end

 100.times do (
   Following.create(
     follower_id: rand(1..20),
     followee_id: rand(1..20)
     )
   )
 end

 100.times do (
   Comment.create(
     content: Faker::Lorem.words(5),
     log_id: rand(1..20),
     user_id: rand(1..20)
     )
   )
 end

20.times do
  log = Log.create(title: Faker::Lorem.sentence(3), duration: "1 hour", user_id: rand(1..20))
  like_count = rand(50)
  like_count.times do
    log.likes.create(value: 1, user_id: rand(1..20))
  end
end



20.times {com = Comment.create(content: Faker::Lorem.sentence(3), user_id: rand(1..20), log_id: rand(1..20) )
  like_count = rand(50)
  like_count.times do
    com.likes.create(value: 1, user_id: rand(1..20))
  end
}
