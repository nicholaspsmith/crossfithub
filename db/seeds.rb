# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#gym = Gym.create(gym_name:"Crossfit Central", location:"123 Fake St")
ex1 = Exercise.create(exercise_name: "Pushup", reps: 20)
wod = Wod.create(wod_name:"Fran")
wod.exercises << ex1
wod.save