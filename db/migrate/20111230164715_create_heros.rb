class CreateHeros < ActiveRecord::Migration
  def change
    create_table :heros do |t|
      t.string    :login
      t.text      :avatar_url
      t.string    :gravatar_id
      t.string    :name
      t.string    :company
      t.string    :blog
      t.string    :location
      t.string    :email
      t.boolean   :hireable
      t.text      :bio
      t.integer   :public_repos
      t.integer   :public_gists
      t.integer   :followers
      t.integer   :following
      t.string    :html_url
      t.datetime  :joined_github_at

      t.timestamps
    end
  end
end
