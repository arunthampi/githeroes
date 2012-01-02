require 'spec_helper'

describe Hero do
  describe "Validations" do
    subject { Factory(:hero) }

    it { should validate_uniqueness_of  :login }
    it { should validate_presence_of    :login }
  end

  describe "Associations" do
    it { should have_many :access_tokens }
  end

end
