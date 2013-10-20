
ex1 = Exercise.create(name: "Pushup", reps: 20)
wod = Wod.create(name:"Fran")
wod.exercises << ex1
wod.save


gym = Gym.create(name:"Crossfit Central")
user = User.create(name:"Nick Smith",img_url:"http://www.placekitten.com/200/200")
gym.users << user
gym.save
