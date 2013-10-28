class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :completion

  VOTE_KIND = { :thumbs_up => 1, :thumbs_down => 2 }

  validates :completion_id, uniqueness: { scope: :user }


  #
  # Vote.create(:kind => Vote::VOTE_KIND[:thumbs_up])

  def thumbs_up?
    self.kind == VOTE_KIND[:thumbs_up]
  end

  def thumbs_down?
    self.kind == VOTE_KIND[:thumbs_down]
  end

  alias :high_five? :thumbs_up?
  alias :shame? :thumbs_down?
  # v = Vote.find 1
  # if v.thumbs_up? XXXXXX
  # else if v.thumbs_down? YYYYY
  # else if v.like?
end
