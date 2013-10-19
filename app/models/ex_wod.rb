class ExWod < ActiveRecord::Base
  # Associates Workout to Exercise
  belongs_to :exercise
  belongs_to :workout
end
