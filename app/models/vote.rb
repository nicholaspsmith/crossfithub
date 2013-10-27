class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :completion

  VOTE_TYPE = { :thumbs_up => 1, :thumbs_down => 2 }


  #
  # Vote.create(:type => Vote::VOTE_TYPE[:thumbs_up])

  def thumbs_up?
    self.kind == VOTE_TYPE[:thumbs_up]
  end

  alias :high_five?, :thumbs_up?
  # v = Vote.find 1
  # if v.thumbs_up? XXXXXX
  # else if v.thumbs_down? YYYYY
  # else if v.like?
end
