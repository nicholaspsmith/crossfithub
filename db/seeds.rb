# Create Gyms
danes = Gym.create(name:"Dane's Body Shop",location:"300 Fake St")

# Create Exercises
pushups = Exercise.create(name:"pushups",reps:30,description:"Puts your hands on the ground and push yourself up")

# Create WODS
fran = Wod.create(name:"Fran",rounds:1,description:"A hard ass workout")
annie = Wod.create(name:"Annie",rounds:1,description:"A workout named after an orphan")
barbara = Wod.create(name:"Barbara",rounds:1,description:"I like eggs")
chelsea = Wod.create(name:"Chelsea",rounds:1,description:"A hard ass workout")
cindy = Wod.create(name:"Cindy",rounds:0,description:"0 rounds means AMRAP")
diane = Wod.create(name:"Diane",rounds:1,description:"A hard ass workout")


# Add Exercises to WODS
fran.exercises << pushups
fran.save

# Add WODS to gyms
danes.wods << fran
danes.save

# Create Users
nick = User.create(name:"Nick Smith",fname:"Nick",lname:"Smith",profile_pic:"https://scontent-a-dfw.xx.fbcdn.net/hphotos-frc3/1395212_10202581883612451_466524952_n.jpg",email:"npsmith1990@gmail.com",password:"a;sldkfjgh")
justin = User.create(name:"Justin Blaisdell",fname:"Justin",lname:"Blaisdell",profile_pic:"https://scontent-a-dfw.xx.fbcdn.net/hphotos-ash3/30315_409670294928_6591159_n.jpg",email:"jsblaisdell@gmail.com",password:"password")
nicole = User.create(name:"Nicole Pank",fname:"Nicole",lname:"Pank",profile_pic:"https://scontent-b-dfw.xx.fbcdn.net/hphotos-ash3/1174903_828444650107_128913837_n.jpg",email:"damnit@gmail.com",password:"password")
clay = User.create(name:"Clay Stewart",fname:"Clay",lname:"Stewart",profile_pic:"https://scontent-a-dfw.xx.fbcdn.net/hphotos-ash4/1001196_649788227468_1573908158_n.jpg",email:"clamstew@gmail.com",password:"password")
ami = User.create(name:"Ami Dave",fname:"Ami",lname:"Dave",profile_pic:"https://scontent-b-dfw.xx.fbcdn.net/hphotos-ash4/1381259_214908285345527_675206342_n.jpg",email:"ami@gmail.com",password:"password")
gamble = User.create(name:"Gamble McAdam",fname:"Gamble",lname:"McAdam",profile_pic:"https://scontent-a-dfw.xx.fbcdn.net/hphotos-prn1/14232_217329480475_1349493_n.jpg",email:"gamble@gmail.com",password:"password")
taylor = User.create(name:"Taylor Smith",fname:"Taylor",lname:"Smith",profile_pic:"https://scontent-a-dfw.xx.fbcdn.net/hphotos-ash3/1006265_10200950300253958_799024679_n.jpg",email:"taylor@gmail.com",password:"password")

# Create Memberships
membership = Membership.create
# Associate Gym and Member through Membership
membership.user = nick
membership.gym = danes
membership.role = "admin"
membership.save

# Create Completions
completion = Completion.create
completion.wod_id = fran.id
completion.milliseconds = 152000
completion.save

completion2 = Completion.create
completion2.wod_id = annie.id
completion2.milliseconds = 234394
completion2.save

completion3 = Completion.create
completion3.wod_id = barbara.id
completion3.milliseconds = 137539
completion3.save


completion4 = Completion.create
completion4.wod_id = barbara.id
completion4.milliseconds = 139502
completion4.save


completion5 = Completion.create
completion5.wod_id = cindy.id
completion5.milliseconds = 1239585
completion5.save


completion6 = Completion.create
completion6.wod_id = cindy.id
completion6.milliseconds = 315951
completion6.save


# associate completion with user
nick.completions << completion
nick.save

nick.completions << completion2
nick.save

justin.completions << completion3
justin.save

nicole.completions << completion4
nicole.save

clay.completions << completion5
clay.save

gamble.completions << completion6
gamble.save





# Create Comments
comment = Comment.new
comment.user = nick
comment.completion = completion
comment.text = "Nice job finishing Fran, Nick!"
comment.save



# Create Badges
badge = Badge.create(name:"Fran Badge")
badge2 = Badge.create(name:"Cindy Badge")
badge.user = nick
badge2.user = nick
badge.save
badge2.save

# Create Votes
vote = Vote.create(:kind => Vote::VOTE_KIND[:thumbs_up])
vote.completion = completion
vote.user = nick
vote.save

vote2 = Vote.create(:kind => Vote::VOTE_KIND[:thumbs_down])
vote.completion = completion
vote2.user = justin
vote2.save

# Create followers
# nick follows everyone
Relationship.create(follower:nick,followed:nicole)
Relationship.create(follower:nick,followed:justin)
Relationship.create(follower:nick,followed:ami)
Relationship.create(follower:nick,followed:clay)
Relationship.create(follower:nick,followed:taylor)
Relationship.create(follower:nick,followed:gamble)

# justin follows three people
Relationship.create(follower:justin,followed:nicole)
Relationship.create(follower:justin,followed:ami)
Relationship.create(follower:justin,followed:nick)

# nicole follows everyone
Relationship.create(follower:nicole,followed:nick)
Relationship.create(follower:nicole,followed:justin)
Relationship.create(follower:nicole,followed:ami)
Relationship.create(follower:nicole,followed:clay)
Relationship.create(follower:nicole,followed:taylor)
Relationship.create(follower:nicole,followed:gamble)

# Ami follows everyone
Relationship.create(follower:ami,followed:nick)
Relationship.create(follower:ami,followed:justin)
Relationship.create(follower:ami,followed:nicole)
Relationship.create(follower:ami,followed:clay)
Relationship.create(follower:ami,followed:taylor)
Relationship.create(follower:ami,followed:gamble)

# Taylor follows devhouse crew
Relationship.create(follower:taylor,followed:clay)
Relationship.create(follower:taylor,followed:gamble)
Relationship.create(follower:taylor,followed:nick)
Relationship.create(follower:taylor,followed:ami)

# Gamble follows devhouse crew
Relationship.create(follower:gamble,followed:taylor)
Relationship.create(follower:gamble,followed:gamble)
Relationship.create(follower:gamble,followed:nick)
Relationship.create(follower:gamble,followed:ami)

# Clay follows everyone
Relationship.create(follower:clay,followed:nick)
Relationship.create(follower:clay,followed:justin)
Relationship.create(follower:clay,followed:ami)
Relationship.create(follower:clay,followed:nicole)
Relationship.create(follower:clay,followed:taylor)
Relationship.create(follower:clay,followed:gamble)


