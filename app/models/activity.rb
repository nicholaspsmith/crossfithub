class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :trackable, polymorphic: true
  # attr_accessible :action, :trackable


private 

  def activity_params
    params.require(activity).permit(:action, :trackable)
  end

end
