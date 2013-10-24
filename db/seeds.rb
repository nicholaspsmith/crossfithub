# Create Gyms
danes = Gym.create(name:"Dane's Body Shop",location:"300 Fake St")

# Create Exercises
pushups = Exercise.create(name:"pushups",reps:30,description:"Puts your hands on the ground and push yourself up")

# Create WODS
fran = Wod.create(name:"Fran",rounds:1,description:"A hard ass workout")

# Add Exercises to WODS
fran.exercises << pushups
fran.save

# Add WODS to gyms
danes.wods << fran
danes.save

# Create Users
nick = User.create(name:"Nick Smith",profile_pic:"doesntmatter.png",email:"npsmith1990@gmail.com",encrypted_password:"doesntmatter",sign_in_count:0)
# Create Memberships
membership = Membership.create()
# Associate Gym and Member through Membership
membership.user = nick
membership.gym = danes
membership.role = "admin"
membership.save

# Create Completions
completion = Completion.create(time:'04:00:00')
# Associate completion with user
completion.user = nick
completion.wod = fran # TODO: Add wod_id.
completion.save

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
vote = Vote.create(kind:"High-Five")
vote.completion = completion
vote.user = nick
vote.save
