class Hero < ActiveRecord::Base
  validates_uniqueness_of :login, :email
  validates_presence_of   :login, :email

  devise :omniauthable

  def to_param
    self.login
  end

  def auto_bio
    bio = <<-EOF
      <p>#{self.login} joined Github in #{self.joined_github_at.strftime("%B %Y")} and has <a href='https://github.com/#{self.login}'>#{self.public_repos} public repos</a> and
      <a href='https://gist.github.com/#{self.login}'>#{self.public_gists} public gists</a>.</p>
    EOF

    if self.location.present? && self.blog.present?
      bio += "<p>#{self.name} is from #{self.location} and blogs at <a href='#{self.blog}'>#{self.blog}</a>.</p>"
    elsif self.location.present?
      bio += "<p>#{self.name} is from #{self.location}.</p>"
    elsif self.blog.present?
      bio += "<p>#{self.name} blogs at <a href='#{self.blog}'>#{self.blog}</a>.</p>"
    end


    bio += "<p>He/She is open to accepting work.</p>" if self.hireable
    bio
  end

end
