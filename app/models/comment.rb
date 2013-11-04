class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :completion

  # create backbone model that hooks to this so that it persists.
end
