require 'spec_helper'

describe AccessToken do
  subject {
    Factory(:access_token, :hero => Factory(:hero))
  }

  describe "Validations" do
    it { should validate_presence_of :provider }
    it { should validate_presence_of :token    }
    it { should validate_presence_of :hero_id  }

    it { should validate_uniqueness_of(:token).scoped_to(:hero_id) }
    it { should validate_uniqueness_of(:provider).scoped_to(:hero_id) }
  end

  describe "Associations" do
    it { should belong_to :hero }
  end
end
