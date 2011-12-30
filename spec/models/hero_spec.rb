require 'spec_helper'

describe Hero do
  describe "Validations" do
    subject { Factory(:hero) }

    it { should validate_uniqueness_of  :email }
    it { should validate_uniqueness_of  :login }
    it { should validate_presence_of    :email }
    it { should validate_presence_of    :login }
  end
end
