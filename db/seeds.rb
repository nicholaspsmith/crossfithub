
ex1 = Exercise.create(name: "Pushup", reps: 20)
wod = Wod.create(name:"Fran")
wod.exercises << ex1
wod.save


gym = Gym.create(name:"Crossfit Central")
nick = User.create(name:"Nick Smith",email:"npsmith1990@gmail.com",img_url:"http://www.placekitten.com/200/200",user_type:"admin")
justin = User.create(name:"Justin Blaisdell",email:"jblaisdell@gmail.com",img_url:"http://www.placekitten.com/g/200/200",user_type:"member")
gym.users << nick
gym.users << justin
gym.save
