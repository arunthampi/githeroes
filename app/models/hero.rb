class Hero < ActiveRecord::Base
  validates_uniqueness_of :login, :email
  validates_presence_of   :login, :email

  def to_param
    self.login
  end

end
