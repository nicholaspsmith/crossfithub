
ex1 = Exercise.create(name: "Pushup", reps: 20)
wod = Wod.create(name:"Fran")
wod.exercises << ex1
wod.save


gym = Gym.create(name:"Crossfit Central")
gym2 = Gym.create(name:"Dane's Body Shop")
user = User.create(name:"Nick Smith",img_url:"http://www.placekitten.com/200/200",  user_type: "coach", email: "nick@gmail.com", password: "password1")
user2 = User.create(name:"Nicole Pank",img_url:"http://www.placekitten.com/225/225", user_type: "admin",  email: "nicole@gmail.com", password: "password2")
user3 = user = User.create(name:"Justin Blaidsell",img_url:"http://www.placekitten.com/230/230",  email: "justin@gmail.com", password: "password3")
user4 = User.create(name:"Bonnie Mattson",img_url:"http://www.placekitten.com/200/200",  email: "bonnie@gmail.com", password: "password4")
user5 = User.create(name:"Clare Glinka",img_url:"http://www.placekitten.com/225/225",  email: "clare@gmail.com", password: "password5")
user6 = user = User.create(name:"Lynda Wellhausen",img_url:"http://www.placekitten.com/230/230",  email: "lynda@gmail.com", password: "password6")
gym.users << user
gym.users << user2
gym.users << user3
gym.save
gym2.users << user4
gym2.users << user5
gym2.users << user6
gym2.save
