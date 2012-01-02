class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :voter_id
      t.integer :votee_id
      t.timestamps
    end

    add_index :votes, :voter_id
    add_index :votes, :votee_id
  end
end
