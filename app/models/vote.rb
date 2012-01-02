class Vote < ActiveRecord::Base
  belongs_to  :votee, :class_name => 'Hero', :counter_cache => :votes_received
  belongs_to  :voter, :class_name => 'Hero'

  validates_presence_of   :voter_id, :votee_id
  validates_uniqueness_of :voter_id,  :scope => :votee_id

  # after_create  :increment_votes_received_counter

  protected
  # def increment_votes_received_counter
  #   puts "Increment Votes Received Counter"
  #   Hero.increment_counter(:votes_received, self.votee_id)
  # end

end
