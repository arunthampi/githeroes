class Hero < ActiveRecord::Base
  validates_uniqueness_of :login
  validates_presence_of   :login

  has_many  :access_tokens

  devise :database_authenticatable, :rememberable, :trackable, :omniauthable

  attr_accessible :login, :email, :company, :location, :hireable, :blog, :following, :followers,
                  :public_repos, :public_gists, :bio, :name, :avatar_url, :html_url, :joined_github_at,
                  :gravatar_id, :following, :password
  attr_readonly   :votes_received

  def to_param
    self.login
  end

  def auto_bio
    bio = <<-EOF
      <p>#{self.login} joined Github in #{self.joined_github_at.strftime("%B %Y")} and has <a href='https://github.com/#{self.login}'>#{self.public_repos} public repos</a> and
      <a href='https://gist.github.com/#{self.login}'>#{self.public_gists} public gists</a>.</p>
    EOF

    if self.location.present? && self.blog.present?
      blog_url = self.blog !~ /http:\/\// ? "http://#{self.blog}" : self.blog
      bio += "<p>#{self.name} is from #{self.location} and blogs at <a href='#{blog_url}'>#{blog_url}</a>.</p>"
    elsif self.location.present?
      bio += "<p>#{self.name} is from #{self.location}.</p>"
    elsif self.blog.present?
      blog_url = self.blog !~ /http:\/\// ? "http://#{self.blog}" : self.blog
      bio += "<p>#{self.name} blogs at <a href='#{blog_url}'>#{blog_url}</a>.</p>"
    end


    bio += "<p>He/She is open to accepting work.</p>" if self.hireable
    bio
  end

  def token_by_provider(provider)
    self.access_tokens.find_by_provider(provider)
  end

  def global_rank
    result = self.class.connection.execute("SELECT pos from (SELECT id, rank() over(ORDER BY votes_received DESC) AS pos FROM heros) AS ss WHERE id = #{self.id}")
    (result.first || {})['pos'].to_i
  end

  def vote_for(hero)
    Vote.create(:votee_id => hero.id, :voter_id => self.id)
  end

  def has_voted_for?(hero)
    Vote.where(:votee_id => hero.id, :voter_id => self.id).count > 0
  end

  def self.find_for_github_oauth(access_token, signed_in_resource = nil)
    data = access_token['extra']['raw_info']

    if hero = Hero.find_by_login(data['login'])
      if (token = hero.token_by_provider('github'))
        token.destroy
      end

      hero.create_access_token_from(access_token)
      hero
    else # Create a user with a stub password.
      hero = Hero.from(data)
      hero.save

      hero.create_access_token_from(access_token)
      hero
    end
  end

  def self.from(hero_params)
    email = hero_params['email']

    if email.blank? || email == 'null'
      email = "user-#{Devise.friendly_token[0,20]}@githero.es"
    end

    Hero.new(
              :login => hero_params['login'],
              :email => email,
              :company => hero_params['company'],
              :location => hero_params['location'],
              :hireable => hero_params['hireable'] == 'true',
              :blog => hero_params['blog'],
              :following => hero_params['following'].to_i,
              :followers => hero_params['followers'].to_i,
              :public_repos => hero_params['public_repos'].to_i,
              :public_gists => hero_params['public_gists'].to_i,
              :bio => hero_params['bio'],
              :name => hero_params['name'],
              :avatar_url => hero_params['avatar_url'],
              :html_url => hero_params['html_url'],
              :joined_github_at => DateTime.parse(hero_params['created_at']),
              :gravatar_id => hero_params['gravatar_id'],
              :following => hero_params['following'].to_i,
              :password => Devise.friendly_token[0,20]
            )
  end

  def self.leaderboard
    Hero.select("id, login, name, location, votes_received, avatar_url, html_url, rank() over(order by votes_received DESC)").limit(20)
  end

  def self.leaderboard_by_location(location)
    Hero.select("id, login, name, location, votes_received, avatar_url, html_url, rank() over(order by votes_received DESC)").where("location = ?", location).limit(20)
  end

  def create_access_token_from(access_token)
    self.access_tokens.create(:token => access_token['credentials']['token'],
                              :provider => access_token['provider'],
                              :uid => access_token['uid'])
  end

end
