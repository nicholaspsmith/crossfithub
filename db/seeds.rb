# Exercises
pushups100 = Exercise.create(name: "Pushup", reps: 100)
pullups100 = Exercise.create(name: "Pullup", reps: 100)
situps100 = Exercise.create(name: "Situp", reps: 100)
squats100 = Exercise.create(name: "Squat", reps: 100)

pullups20 = Exercise.create(name: "Pullup", reps: 20)
pushups30 = Exercise.create(name: "Pushup", reps: 30)
situps40 = Exercise.create(name: "Situp", reps: 40)
squats50 = Exercise.create(name: "Squat", reps: 50)

pullups5 = Exercise.create(name: "Pullup", reps: 5)
pushups10 = Exercise.create(name: "Pushup", reps: 10)
squats15 = Exercise.create(name: "Squat", reps: 15)

deadlift225lbs21 = Exercise.create(name:"Deadlift",weight: 225)
handstandpushups21 = Exercise.create(name:"Handstand pushups")
deadlift225lbs15 = Exercise.create(name:"Deadlift",weight: 225)
handstandpushups15 = Exercise.create(name:"Handstand pushups")
deadlift225lbs9 = Exercise.create(name:"Deadlift",weight: 225)
handstandpushups9 = Exercise.create(name:"Handstand pushups")


# WODs
angie = Wod.create(name:"Angie")
angie.exercises << pullups100
angie.exercises << pushups100
angie.exercises << situps100
angie.exercises << squats100
angie.rounds = 1
angie.save

barbara = Wod.create(name:"Barbara")
barbara.exercises << pullups20
barbara.exercises << pushups30
barbara.exercises << situps40
barbara.exercises << squats50
barbara.rounds = 5
barbara.save

chelsea = Wod.create(name:"Chelsea")
chelsea.exercises << pullups5
chelsea.exercises << pushups10
chelsea.exercises << squats15
chelsea.rounds = 1
chelsea.description = "Every minute on the minute for 30 minutes"
chelsea.save


diane = Wod.create(name:"Diane")
diane.exercises << deadlift225lbs21
diane.exercises << handstandpushups21
diane.exercises << deadlift225lbs15
diane.exercises << handstandpushups15
diane.exercises << deadlift225lbs9
diane.exercises << handstandpushups9
diane.rounds = 1
diane.save


# Gyms
gym = Gym.create(name:"Crossfit Central",location:"6205-A Burnet Road")
gym2 = Gym.create(name:"Dane's Body Shop",location:"4227 Guadalupe St  Austin, TX 78751")

# Users
nick = User.create(name:"Nick Smith",profile_pic:"http://www.placekitten.com/200/200",  user_type: "coach", email: "nick@gmail.com", password: "password1")
nicole = User.create(name:"Nicole Pank",profile_pic:"http://www.placekitten.com/225/225", user_type: "admin",  email: "nicole@gmail.com", password: "password2")
justin = User.create(name:"Justin Blaisdell",profile_pic:"http://www.placekitten.com/230/230",  email: "justin@gmail.com", password: "password3")
bonnie = User.create(name:"Bonnie Mattson",profile_pic:"http://www.placekitten.com/g/200/200",  email: "bonnie@gmail.com", password: "password4")
clare = User.create(name:"Clare Glinka",profile_pic:"http://www.placekitten.com/g/225/225",  email: "clare@gmail.com", password: "password5")
lynda = User.create(name:"Lynda Wellhausen",profile_pic:"http://www.placekitten.com/g/230/230",  email: "lynda@gmail.com", password: "password6")

# Add users(members) to gym
gym.users << nick
gym.users << nicole
gym.users << justin
# Add WODs to gym
gym.wods << barbara
gym.wods << angie
gym.wods << diane
gym.save



# Add users(members) to gym2
gym2.users << bonnie
gym2.users << clare
gym2.users << lynda
# Add WODs to gym2
gym2.wods << angie
gym2.wods << barbara
gym2.wods << chelsea
gym2.wods << diane
gym2.save

# Add completion and up vote (TODO: needs to be associated with user)
vote = Vote.create(kind: 'up')
vote.completion = Completion.create(time: Time.now)
vote.save

# Add completion and up comment (TODO: needs to be associated with user)
comment = Comment.create(text: 'Cool story bro, tell it again.')
comment.completion = Completion.create(time: Time.now)
comment.save
