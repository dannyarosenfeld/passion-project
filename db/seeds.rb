comments = [
"Franzen vice deep v green juice schlitz banh mi before they sold out neutra. 8-bit ramps asymmetrical fap bushwick.",
"Lomo letterpress kogi swag, kitsch meditation deep v art party paleo locavore.",
"Neutra pitchfork schlitz, crucifix swag put a bird on it truffaut kickstarter ",
"kogi banh mi cray quinoa listicle gastropub. Retro ennui occupy pabst. ",
"Pitchfork butcher forage, pork belly skateboard art party slow-carb echo park flannel wayfarers lomo biodiesel ",
"freegan gentrify. Aesthetic echo park yr hammock, yuccie bicycle rights butcher offal kickstarter.",
"Craft beer drinking vinegar small batch, cornhole pinterest aesthetic trust fund plaid cliche williamsburg ",
"gluten-free authentic. Ennui ethical godard pinterest neutra, intelligentsia echo park retro gluten-free ",
"shoreditch cred migas chartreuse XOXO. Shabby chic biodiesel yuccie, single-origin coffee whatever direct trade",
"gastropub try-hard. Meggings mumblecore migas, occupy pug leggings farm-to-table venmo tumblr portland freegan. ",
"Four loko lo-fi ennui, mustache pickled ramps marfa. Scenester forage master cleanse waistcoat, artisan brooklyn ",
"authentic neutra DIY twee aesthetic cardigan slow-carb irony.",
"Occupy organic banjo pitchfork, chillwave narwhal quinoa."
]

  exercises = [
"Plank up-down",
"Standard push-up ",
"Walking push-up",
"T push-up",
"Spiderman push-up",
"Staggered push-up",
"Wide grip push-up",
"Negative push-up",
"One foot elevated push-up",
"Hindu push-up",
"Incline push-up",
"Feet elevated push-up",
"Tricep push-up",
"Tricep bench dip",
"Elevated tricep bench dip",
"Lying triceps lift ",
"Handstand hold",
"Inch worm",
"Shoulder circles",
"Lateral raise ",
"Pike shoulder press",
"Pull-up",
"Jumping pull-ups",
"Straight arm shoulder raise",
"Air boxing",
"Shoulder stabilization series"
  ]




i = 0
20.times do (
  avatars = ["http://kunmingrock.com/wp-content/uploads/funny-looking-white-guy2-150x150.jpg",
  "https://media.licdn.com/mpr/mpr/shrink_100_100/p/4/005/071/0bf/0d0bbbd.jpg",
  "https://s-media-cache-ak0.pinimg.com/236x/0e/a5/2a/0ea52a6e76028e9709ed32c23c4d22a7.jpg",
  "http://www.ces.clemson.edu/spilla/wp-content/uploads/2014/04/Web-profile3-150x150.jpg",
  "http://www.active.com/Assets/Swimming/swimming-yoga.jpg",
  "http://www.ultiphotos.com/img/s2/v61/p1230985504-3.jpg",
  "https://scontent.cdninstagram.com/hphotos-xat1/t51.2885-15/s150x150/e35/c237.0.605.605/12328350_1715315002035044_1302712250_n.jpg",
  "http://loughboroughsport.com/au-football-women/files/2014/08/12115500_1052975911401131_5293067558543813036_n-150x150.jpg",
  "http://www.10honeymoondestinations.com/wp-content/uploads/2013/08/Rock-Climbing-150x150.jpg",
  "http://baristanet.com/wp-content/uploads/2016/05/IMG_0156-150x150.jpg",
  "http://bethrodden.com/wp-content/uploads/2016/03/IMG_9477-150x150.jpg",
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
     content: comments.sample,
     log_id: rand(1..20),
     user_id: rand(1..20)
     )
   )
 end

locationary = ["san francisco", "concord ca", "antioch ca", "vallejo", "el cerrito", "orinda ca", "lafayette", "san jose", "walnut creek" "california", "berkeley", "fremont", "richmond california", "walnut creek", "daly city"]
20.times do
  log = Log.create(title: exercises.sample, duration: "1 hour", user_id: rand(1..20), location: locationary.sample)
  like_count = rand(50)
  like_count.times do
    log.likes.create(value: 1, user_id: rand(1..20))
  end
end

100.times do

  Workout.create(name: exercises.sample, sets: rand(1..3), reps: rand(1..15), log_id: rand(1..20))

end


20.times {com = Comment.create(content: comments.sample, user_id: rand(1..20), log_id: rand(1..20) )
  like_count = rand(50)
  like_count.times do
    com.likes.create(value: 1, user_id: rand(1..20))
  end
}
