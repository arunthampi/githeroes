require 'spec_helper'

describe Vote do
  describe "Associations" do
    it { should belong_to :voter }
    it { should belong_to :votee }
  end

  describe "Validations" do
    subject { Factory(:vote) }

    it { should validate_presence_of :voter_id }
    it { should validate_presence_of :votee_id }
    it { should validate_uniqueness_of(:voter_id).scoped_to(:votee_id) }
  end

  describe "Callbacks" do
    describe "Counter Cache" do
      let!(:voter_1)  { Factory(:hero) }
      let!(:voter_2)  { Factory(:hero) }
      let!(:votee)    { Factory(:hero) }

      it "should keep incrementing the votes_received counter on the votee" do
        Vote.create(:votee_id => votee.id, :voter_id => voter_1.id)
        votee.reload.votes_received.should == 1

        Vote.create(:votee_id => votee.id, :voter_id => voter_2.id)
        votee.reload.votes_received.should == 2
      end
    end
  end

end
