i = 0
20.times do (
  avatars = ["https://www.govloop.com/wp-content/uploads/avatars/105863/b226a950b0005d6f346ad723642c6629-bpthumb.jpg",
  "https://media.licdn.com/mpr/mpr/shrink_100_100/p/4/005/071/0bf/0d0bbbd.jpg",
  "https://s-media-cache-ak0.pinimg.com/236x/0e/a5/2a/0ea52a6e76028e9709ed32c23c4d22a7.jpg",
  "http://www.ces.clemson.edu/spilla/wp-content/uploads/2014/04/Web-profile3-150x150.jpg",
  "http://www.active.com/Assets/Swimming/swimming-yoga.jpg",
  "http://www.ultiphotos.com/img/s2/v61/p1230985504-3.jpg",
  "http://loughboroughsport.com/au-football-women/files/2014/08/12115500_1052975911401131_5293067558543813036_n-150x150.jpg",
  "http://www.10honeymoondestinations.com/wp-content/uploads/2013/08/Rock-Climbing-150x150.jpg",
  "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&ved=&url=http%3A%2F%2Fwww.mortensvenningsen.com%2Fphotos%2Fd%2F142-2%2FRock%2BClimbing%2B2.jpg&bvm=bv.123664746,d.cGc&psig=AFQjCNEw_DVb5ajtGrhprJto-elQFbfUgg&ust=1465177561733610",
  "http://baristanet.com/wp-content/uploads/2016/05/IMG_0156-150x150.jpg",
  "https://s-media-cache-ak0.pinimg.com/236x/9a/52/f5/9a52f5105ea68189fa1568b2d2acb70a.jpg",
  "http://www.literaryorphans.org/playdb/wp-content/uploads/2015/12/Invisiblemartyr-profile-picture-150x150.jpg",
  "http://www.cbn2.com/wp-content/uploads/2014/01/hipster-men-fashion-hairstyles-183491-150x150.jpg",
"http://annapolisrunningclassic.com/wp-content/uploads/2015/05/Eric-Shulman-cropped3-150x150.png",
"http://43gx1sisnq61jk35v3b4jepn.wpengine.netdna-cdn.com/wp-content/uploads/2015/02/3-150x150.png",
"http://www.xplodingstereotypes.com/wp-content/uploads/2016/05/160501_201434_England-150x150.jpg",
"http://www.themusichall.org/assets/uploads/images/guycapecelatro_150px_web.jpg",
"https://davehakkens.nl/wp-content/uploads/avatars/1/b60054d5d985e8bdca99f50e927951c8-bpthumb.jpg",
"http://msganawrites.com/wp-content/uploads/2013/12/IMG_09372-150x150.jpg",
"http://forevertwentysomethings.com/wp-content/uploads/2014/04/4211380292_office20hangover_xlarge-150x150.jpg",
"http://www.yourmira.org/wp-content/themes/mira/scripts/timthumb.php?src=/media/uploads/2013/03/NIK_0328.jpg&w=150&h=150&zc=1&q=100"]


   User.create(
     username: Faker::Internet.user_name,
     image: avatars[i],
     password: "123"
     )
   i += 1
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

100.times do
  Workout.create(name: Faker::Lorem.sentence(3), sets: rand(1..3), reps: rand(1..15), log_id: rand(1..20))

end

20.times {com = Comment.create(content: Faker::Lorem.sentence(3), user_id: rand(1..20), log_id: rand(1..20) )
  like_count = rand(50)
  like_count.times do
    com.likes.create(value: 1, user_id: rand(1..20))
  end
}
