class Vote < ActiveRecord::Base
  belongs_to  :votee, :class_name => 'Hero', :counter_cache => :votes_received
  belongs_to  :voter, :class_name => 'Hero'

  validates_presence_of   :voter_id, :votee_id
  validates_uniqueness_of :voter_id,  :scope => :votee_id

  validate :check_if_hero_votes_for_himself

  def check_if_hero_votes_for_himself
    errors.add(:votee_id, "You can't vote for yourself, unfortunately") if votee_id == voter_id
  end

end
