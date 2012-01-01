class AccessToken < ActiveRecord::Base
  belongs_to :hero

  validates_presence_of :provider, :token, :hero_id
  validates_uniqueness_of :token, :scope => :hero_id
  validates_uniqueness_of :provider, :scope => :hero_id
end
