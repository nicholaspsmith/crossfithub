class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :completion

  def as_json(options={})
    {
      id: self.id,
      user_id: self.user_id,
      completion_id: self.completion_id,
      # kind: self.kind,
      name: self.name,
      comment: self.comment
    }
  end

  # def create
    
  # end
end
