# Exercises
ex1 = Exercise.create(name: "Pushup", reps: 20)

# WODs
wod = Wod.create(name:"Fran")
wod.exercises << ex1
wod.save

# Gyms
gym = Gym.create(name:"Crossfit Central")
gym2 = Gym.create(name:"Dane's Body Shop")

# Users
nick = User.create(name:"Nick Smith",profile_pic:"http://www.placekitten.com/200/200",  user_type: "coach", email: "nick@gmail.com", password: "password1")
nicole = User.create(name:"Nicole Pank",profile_pic:"http://www.placekitten.com/225/225", user_type: "admin",  email: "nicole@gmail.com", password: "password2")
justin = User.create(name:"Justin Blaidsell",profile_pic:"http://www.placekitten.com/230/230",  email: "justin@gmail.com", password: "password3")
bonnie = User.create(name:"Bonnie Mattson",profile_pic:"http://www.placekitten.com/g/200/200",  email: "bonnie@gmail.com", password: "password4")
clare = User.create(name:"Clare Glinka",profile_pic:"http://www.placekitten.com/g/225/225",  email: "clare@gmail.com", password: "password5")
lynda = User.create(name:"Lynda Wellhausen",profile_pic:"http://www.placekitten.com/g/230/230",  email: "lynda@gmail.com", password: "password6")

gym.users << nick
gym.users << nicole
gym.users << justin
gym.save


gym2.users << bonnie
gym2.users << clare
gym2.users << lynda
gym2.save
