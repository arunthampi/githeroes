class CreateAccessTokens < ActiveRecord::Migration
  def self.up
    create_table :access_tokens do |t|
      t.string :provider, :null => false
      t.string :uid
      t.string :token, :null => false
      t.string :secret

      t.references :hero

      t.timestamps
    end

    add_index :access_tokens, :hero_id
  end

  def self.down
    drop_table :access_tokens
  end
end
