class AddVotesReceivedColumnToHero < ActiveRecord::Migration
  def self.up
    add_column :heros, :votes_received, :integer, :default => 0
    execute("CREATE INDEX desc_votes_recvd_idx on heros(votes_received DESC NULLS LAST);")
  end

  def self.down
    remove_column :heros, :votes_received
    execute("DROP INDEX IF EXISTS desc_votes_recvd_idx;")
  end
end